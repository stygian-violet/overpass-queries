[out:json];

rel(165479) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	nwr(area.search_area)[~"mortuary"~"."];
	nwr(area.search_area)[~"amenity"~"mortuary"];
	nwr(area.search_area)[building="mortuary"];
	nwr(area.search_area)["church:type"="mortuary"];
	nwr(area.search_area)["building:part"="mortuary"];
) -> .mortuaries;

(
	nwr(area.search_area)[crematorium];
	nwr(area.search_area)[~"amenity"~"crematorium"];
	nwr(area.search_area)[building="crematorium"];
	nwr(area.search_area)[animal="crematorium"];
	nwr(area.search_area)[landuse="crematorium"];
) -> .crematoria;

(
	nwr(area.search_area)[place_of_mourning];
	nwr(area.search_area)[amenity=place_of_mourning];

	nwr(area.search_area)[funeral_hall];
	nwr(area.search_area)[amenity=funeral_hall];

	nwr(area.search_area)[~"grave([^l]|$)"~"."];
	nwr(area.search_area)[~"amenity"~"grave([^l]|$)"];
	nwr(area.search_area)[man_made="grave"];
	nwr(area.search_area)[landuse="grave_yard"];
	nwr(area.search_area)[archaeological_site="grave_field"];
	nwr(area.search_area)[building="grave_yard"];
	nwr(area.search_area)[historic="grave_yard"];

	nwr(area.search_area)[cemetery];
	nwr(area.search_area)[landuse="cemetery"];
	nwr(area.search_area)[denotation="cemetery"];
	nwr(area.search_area)[historic="cemetery"];
	nwr(area.search_area)["church:type"="cemetery"];
	nwr(area.search_area)[animal="cemetery"];

	nwr(area.search_area)[tomb];
	nwr(area.search_area)[historic="tomb"];
	nwr(area.search_area)[building="tomb"];
	nwr(area.search_area)[man_made="tomb"];
	nwr(area.search_area)[archaeological_site="tomb"];
	nwr(area.search_area)[memorial="tomb"];
	nwr(area.search_area)[ruins="tomb"];

	nwr(area.search_area)[tumulus];
) -> .misc;

(.mortuaries; .crematoria;) -> .main;
(.main; .misc;) -> .all;

(
	nwr.all[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

// nwr.misc.abandoned -> .misc;
// (.main; .misc;) -> .all;

node.mortuaries;
convert node ::id=id(), is_mortuary="1";
out;
way.mortuaries;
convert way ::id=id(), is_mortuary="1";
out;
rel.mortuaries;
convert relation ::id=id(), is_mortuary="1";
out;

node.crematoria;
convert node ::id=id(), is_crematorium="1";
out;
way.crematoria;
convert way ::id=id(), is_crematorium="1";
out;
rel.crematoria;
convert relation ::id=id(), is_crematorium="1";
out;

node.abandoned;
convert node ::id=id(), is_abandoned="1";
out;
way.abandoned;
convert way ::id=id(), is_abandoned="1";
out;
rel.abandoned;
convert relation ::id=id(), is_abandoned="1";
out;

.all out geom;

{{style:
node, way, relation{
	color: #113333;
	fill-color: #8888cc;
}
node[is_mortuary], way[is_mortuary], relation[is_mortuary]{
	color: #444400;
	fill-color: #ffff44;
}
node[is_crematorium], way[is_crematorium], relation[is_crematorium]{
	color: #440000;
	fill-color: #ff4444;
}
node[is_abandoned], way[is_abandoned], relation[is_abandoned] {
	color: #334422;
	fill-color: #66aa44;
}
node[is_abandoned][is_mortuary], way[is_abandoned][is_mortuary], relation[is_abandoned][is_mortuary], node[is_abandoned][is_crematorium], way[is_abandoned][is_crematorium], relation[is_abandoned][is_crematorium] {
	color: #004400;
	fill-color: #44ff44;
}
}}
