SRC_DIR := src
STYLE_DIR := img/style

EXTRACT_STYLE_CMD := ./extract_style.py
EXTRACT_STYLE_OPTS := -w 200 -f default -s 14 -c '\#03f' '\#fc0'

IN_AREA := $(wildcard $(SRC_DIR)/*_in_area.overpassql)
IN_BBOX := $(foreach src, $(IN_AREA), $(subst _in_area.,_in_bbox.,$(src)))
ALL_IN_BBOX := $(IN_BBOX) $(wildcard $(SRC_DIR)/*_in_bbox.overpassql)
STYLES := $(foreach src, $(ALL_IN_BBOX), $(subst $(SRC_DIR),$(STYLE_DIR),$(subst _in_bbox.overpassql,.png,$(src))))

.PHONY: all in_bbox styles

all: in_bbox styles

in_bbox: $(IN_BBOX)

styles: $(STYLES)

%_in_bbox.overpassql: %_in_area.overpassql $(MAKEFILE_LIST)
	sed -r '/^\[out:/,/map_to_area/ { s/\];$$/][bbox:{{bbox}}];/; t; d; }; s/\s*\(\s*area\.search_area\s*\)\s*//g; T e; /^$$/ d; :e /\.search_area/ d;' $< >$@

$(STYLE_DIR)/%.png: $(SRC_DIR)/%_in_bbox.overpassql $(EXTRACT_STYLE_CMD) $(MAKEFILE_LIST)
	$(EXTRACT_STYLE_CMD) $(EXTRACT_STYLE_OPTS) $< $@
