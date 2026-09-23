#!/usr/bin/env python3

import re
import sys

from argparse import ArgumentParser, Namespace
from itertools import islice
from typing import NamedTuple

from PIL import Image, ImageDraw, ImageFont

class Style(NamedTuple):
    selector: str
    stroke: str
    fill: str

def parse_args(argv: [str] | None) -> Namespace:
    parser = ArgumentParser()

    parser.add_argument(
        '-w', '--width', type=int, default=200,
        help='image width (default: %(default)s)'
    )
    parser.add_argument(
        '-f', '--font', type=str, default=None,
        help='font file'
    )
    parser.add_argument(
        '-s', '--font-size', type=int, default=14,
        help='image width (default: %(default)s)'
    )
    parser.add_argument(
        '-c', '--default-color', type=str, nargs=2,
        metavar=('STROKE', 'FILL'), default=('#03f', '#fc0'),
        help='default stroke and fill colors (default: %(default)s)'
    )
    parser.add_argument('input', type=str, help='query file')
    parser.add_argument('output', type=str, help='image file')

    return parser.parse_args(argv)

def format_selectors(selectors: str) -> str:
    values = set()
    for selector in selectors.split(','):
        selector_values = set()
        for m in re.finditer(
            r'\[\s*[\'"]?([^ =]+?)[\'"]?\s*(?:=\s*[\'"]?(.*?)[\'"]?\s*?)?\]',
            selector
        ):
            key = m.group(1)
            value = m.group(2)
            if not value:
                value = key
            value = value.replace('_', ' ')
            if value.startswith('is '):
                value = value[3:]
            selector_values.add(value)
        if selector_values:
            values.add(' and '.join(sorted(selector_values)))
        else:
            values.add('default')
    if not values:
        values.add('default')
    return '\n'.join(val.capitalize() for val in sorted(values))

def extract_styles(fname: str, default_stroke: str, default_fill: str) -> [Style]:
    res: [Style] = []
    with open(fname, 'r') as fp:
        query = fp.read()
    query = re.sub(r'//.*$', '', query, flags=re.MULTILINE)
    query = re.sub(r'/\*.*?(\*/|$)', '', query, flags=re.DOTALL)
    has_default = False
    for style in re.finditer(r'{{\s*style\s*:(.*)}}', query, flags=re.DOTALL):
        rules = style.group(1).strip().split('}')
        for rule in rules:
            rule = rule.strip().split('{', 1)
            if len(rule) != 2:
                continue
            stroke = default_stroke
            fill = default_fill
            for prop in rule[1].split(';'):
                prop = prop.split(':', 1)
                if len(prop) != 2:
                    continue
                value = prop[1].strip()
                match prop[0].strip():
                    case 'color':
                        stroke = value
                    case 'fill-color':
                        fill = value
            selectors = format_selectors(rule[0])
            has_default = has_default or 'Default' in selectors
            res.append(Style(selectors, stroke, fill))
    res.reverse()
    if not has_default:
        res.append(Style(format_selectors(''), default_stroke, default_fill))
    return res

def styles_to_lines(
    styles: [Style],
    font: ImageFont.BaseImageFont,
    line_width: int
) -> ([int], [str]):
    points: [int] = []
    lines: [str] = []
    line = 0
    for style in styles:
        points.append(line)
        for line_ in style.selector.split('\n'):
            line_part = ''
            for word in line_.split():
                if not line_part:
                    line_part = word
                    continue
                new_line_part = ' '.join((line_part, word))
                if font.getlength(new_line_part) <= line_width:
                    line_part = new_line_part
                else:
                    lines.append(line_part)
                    line_part = word
                    line += 1
            if line_part:
                lines.append(line_part)
                line += 1
    return points, lines

def styles_to_image(
    styles: [Style],
    width: int = 300,
    font_name: str | None = None,
    font_size: int = 14
) -> Image.Image:
    if font_name is None or font_name == '' or font_name == 'default':
        font = ImageFont.load_default(font_size)
    else:
        font = ImageFont.truetype(font_name, size=font_size)
    asc, desc = font.getmetrics()
    line_height = asc + desc
    point_radius = line_height // 2
    stroke_width = max(2, point_radius // 4)
    padding = font_size // 2
    line_width = width - 2 * point_radius - 3 * padding
    points, lines = styles_to_lines(styles, font, line_width)
    img = Image.new(
        'RGBA',
        (width, padding * (len(points) + 1) + line_height * len(lines)),
        (0, 0, 0, 0)
    )
    draw = ImageDraw.Draw(img)
    x = padding + point_radius
    y = x
    points.append(len(lines))
    for line, next_line, style in zip(points, islice(points, 1, len(points)), styles):
        draw.circle(
            (x, y),
            point_radius,
            outline=style.stroke,
            fill=style.fill,
            width=stroke_width
        )
        for text in islice(lines, line, next_line):
            draw.text(
                (x * 2, y),
                text,
                font=font,
                fill=(255, 255, 255, 255),
                stroke_width=stroke_width,
                stroke_fill=(0, 0, 0, 255),
                anchor='lm'
            )
            y += line_height
        y += padding
    return img

def main(argv: [str] | None = None) -> int:
    args = parse_args(argv)
    styles = extract_styles(args.input, args.default_color[0], args.default_color[1])
    img = styles_to_image(
        styles,
        width=args.width,
        font_name=args.font,
        font_size=args.font_size
    )
    img.save(args.output)
    return 0

if __name__ == '__main__':
    sys.exit(main())
