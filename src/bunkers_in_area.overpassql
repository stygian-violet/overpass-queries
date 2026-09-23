[out:json];

rel(165473) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	nwr(area.search_area)[~"bunker"~"."];
	nwr(area.search_area)[military="bunker"];
	nwr(area.search_area)[building="bunker"];
	nwr(area.search_area)[historic="bunker"];
	nwr(area.search_area)[ruins="bunker"];
	nwr(area.search_area)[man_made="bunker"];
	nwr(area.search_area)["building:part"="bunker"];
	nwr(area.search_area)[abandoned="bunker"];

	// Times out
	// nwr(area.search_area)[~"building|military"~"bunker"];

	nwr(area.search_area)["abandoned:military"="bunker"];
	nwr(area.search_area)["demolished:military"="bunker"];
	nwr(area.search_area)["destroyed:military"="bunker"];
	nwr(area.search_area)["disused:military"="bunker"];
	nwr(area.search_area)["razed:military"="bunker"];
	nwr(area.search_area)["removed:military"="bunker"];
	nwr(area.search_area)["ruins:military"="bunker"];
	nwr(area.search_area)["was:military"="bunker"];

	nwr(area.search_area)["abandoned:building"="bunker"];
	nwr(area.search_area)["demolished:building"="bunker"];
	nwr(area.search_area)["destroyed:building"="bunker"];
	nwr(area.search_area)["disused:building"="bunker"];
	nwr(area.search_area)["razed:building"="bunker"];
	nwr(area.search_area)["removed:building"="bunker"];
	nwr(area.search_area)["ruins:building"="bunker"];
	nwr(area.search_area)["was:building"="bunker"];
) -> .all;

(
	nwr.all[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

nwr.all[historic] -> .historic;

node.abandoned;
convert node ::id=id(), is_abandoned="1";
out;
way.abandoned;
convert way ::id=id(), is_abandoned="1";
out;
rel.abandoned;
convert relation ::id=id(), is_abandoned="1";
out;

node.historic;
convert node ::id=id(), is_historic="1";
out;
way.historic;
convert way ::id=id(), is_historic="1";
out;
rel.historic;
convert relation ::id=id(), is_historic="1";
out;

.all out geom;

{{style:
node, way, relation{
	color: #444400;
	fill-color: #ffff44;
}
node[is_historic], way[is_historic], relation[is_historic]{
	color: #000044;
	fill-color: #4444ff;
}
node[is_abandoned], way[is_abandoned], relation[is_abandoned] {
	color: #004400;
	fill-color: #44ff44;
}
}}
