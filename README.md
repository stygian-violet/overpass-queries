# overpass-queries

- [Usage](#usage)
- [Contents](#contents)
- [Development](#development)
- [See also](#see-also)
- [Licences](#licenses)

## Usage

1. Open a `.overpassql` file.
2. Copy and paste the contents of the file to [Overpass Turbo](https://overpass-turbo.eu/) or [Overpass Ultra](https://overpass-ultra.us/).
3. `*_in_area.overpassql`: Edit line #3 to write the area of search to the variable `search_area`. To find the id(s) of the area of search, [Nominatim](https://nominatim.openstreetmap.org/ui/search.html) or [admin_level_in_bbox](src/admin_level_in_bbox.overpassql) can be used.\
   `*_in_bbox.overpassql`: Move the map to the area of search.
4. Click `Run` in the top left corner.
5. `*_in_area.overpassql`: Click `zoom to data` on the map.

## Contents

<table>
	<tr>
		<th>Query</th>
		<th colspan="2">Files</th>
		<th width="250">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Style&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</th>
		<th>Notes</th>
	</tr>
	<tr>
		<td>Abandoned objects</td>
		<td><a href="src/abandoned_in_area.overpassql">area</a></td>
		<td><a href="src/abandoned_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/abandoned.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Lifecycle_prefix#Stages_of_decay">
				Lifecycle prefixes
			</a>
		</td>
	</tr>
	<tr>
		<td>Administrative boundaries</td>
		<td></td>
		<td><a href="src/admin_level_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/admin_level.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Tag:boundary%3Dadministrative#Country_specific_values_of_the_key_admin_level%3D*">
				Country specific values ​​of the key admin_level=*
			</a>
		</td>
	</tr>
	<tr>
		<td>Bridges</td>
		<td></td>
		<td><a href="src/bridges_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/bridges.png"></td>
		<td>WIP</td>
	</tr>
	<tr>
		<td>Bunkers</td>
		<td><a href="src/bunkers_in_area.overpassql">area</a></td>
		<td><a href="src/bunkers_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/bunkers.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Caves</td>
		<td><a href="src/caves_in_area.overpassql">area</a></td>
		<td><a href="src/caves_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/caves.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Cryptocurrency ATMs</td>
		<td><a href="src/crypto_atms_in_area.overpassql">area</a></td>
		<td><a href="src/crypto_atms_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/crypto_atms.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Fixme</td>
		<td><a href="src/fixme_in_area.overpassql">area</a></td>
		<td><a href="src/fixme_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/fixme.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Key:fixme">Key:fixme</a>
		</td>
	</tr>
	<tr>
		<td>Hazards</td>
		<td><a href="src/hazards_in_area.overpassql">area</a></td>
		<td><a href="src/hazards_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/hazards.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Lighthouses and beacons</td>
		<td><a href="src/lighthouses_in_area.overpassql">area</a></td>
		<td><a href="src/lighthouses_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/lighthouses.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Localities</td>
		<td><a href="src/localities_in_area.overpassql">area</a></td>
		<td><a href="src/localities_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/localities.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Tag:place%3Dlocality">
				Tag:place=locality
			</a>
		</td>
	</tr>
	<tr>
		<td>Mines and quarries</td>
		<td><a href="src/mines_in_area.overpassql">area</a></td>
		<td><a href="src/mines_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/mines.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Mortuaries, crematoria and graveyards</td>
		<td><a href="src/mortuaries_in_area.overpassql">area</a></td>
		<td><a href="src/mortuaries_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/mortuaries.png"></td>
		<td>‌‍‌‍‌‍‍‍‌‍‍‌‍‌‌‌█████ ‌‍‍‌‌‌‌‍████‌‍‍‍‌‍‌‌‌‌‍‌‌‌‌‌ ‌‍‍‌‌‌‌‍████‌‍‍‍‌‌‍‌‌‍‍‌‌‍‌‍‌‌‍‌‌‌‌‌ ‌‍‍‍‍‌‌‍‌‍‍‌‍‍‍‍‌‍‍‍‌‍‌‍█████‌‌‍‌‌‌‌‌‌‍‍‌‌‍‌‌‌‍‍‌‍‍‍‍‌‍‍‌‍‌‌‍‌‍‍‌‍‍‍‌‌‍‍‌‌‍‍‍‌‌‍‌‌‌‌‌ █████‌‍‍‌‍‌‌‌‌‍‍‌‌‍‌‍ ‌‍‍‍‌‌‍‌██‌‍‍‌‌‍‌‍ ████‌‌‍‍‍‍‍‍ ‌‌‌‌‍‌‍‌███</td>
	</tr>
	<tr>
		<td>Notes</td>
		<td><a href="src/notes_in_area.overpassql">area</a></td>
		<td><a href="src/notes_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/notes.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Key:note">Key:note</a>
		</td>
	</tr>
	<tr>
		<td>Radio</td>
		<td><a href="src/radio_in_area.overpassql">area</a></td>
		<td><a href="src/radio_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/radio.png"></td>
		<td></td>
	</tr>
	<tr>
		<td>Was</td>
		<td><a href="src/was_in_area.overpassql">area</a></td>
		<td><a href="src/was_in_bbox.overpassql">bbox</a></td>
		<td><img alt="Style" src="img/style/was.png"></td>
		<td>
			<a href="https://wiki.openstreetmap.org/wiki/Key:was:*">Key:was:*</a>
		</td>
	</tr>
</table>

## Development

### Requirements

- [Make](https://www.gnu.org/software/make/)
- [sed](https://www.gnu.org/software/sed/)
- [Python 3](https://www.python.org/)
- [Pillow](https://pypi.org/project/pillow/)

### Building

```bash
# Build everything
make

# Generate *_in_bbox.overpassql from *_in_area.overpassql
make in_bbox

# Generate style images
make styles
```

## See also

- [Overpass Turbo instances](https://wiki.openstreetmap.org/wiki/Overpass_Turbo#Instances)
- [Overpass Ultra instances](https://wiki.openstreetmap.org/wiki/Overpass_Ultra#Instances)
- [Public Overpass API instances](https://wiki.openstreetmap.org/wiki/Overpass_API#Public_Overpass_API_instances)
- [Language reference](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)
- [Map features](https://wiki.openstreetmap.org/wiki/Map_features)
- [Nominatim](https://nominatim.openstreetmap.org/ui/search.html)
- [Taginfo](https://taginfo.openstreetmap.org/)
- [TagFinder](https://tagfinder.osm.ch/)
