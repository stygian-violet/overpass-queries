[out:json];

rel(148838) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	nwr(area.search_area)[~"cave"~"."];
	nwr(area.search_area)[fixme~"cave", i];
	nwr(area.search_area)[natural="cave_entrance"];
	nwr(area.search_area)[protection_object="cave"];
	nwr(area.search_area)[tunnel="cave"];
	nwr(area.search_area)[natural="cave"];
	nwr(area.search_area)[man_made="cave_entrance"];
	nwr(area.search_area)[man_made="cave"];
	nwr(area.search_area)[geological="cave_entrance"];
	nwr(area.search_area)[location="cave"];
	nwr(area.search_area)[building="cave"];
	nwr(area.search_area)[archaeological_site="cave"];
	nwr(area.search_area)[amenity="cave"];
);

out geom;
