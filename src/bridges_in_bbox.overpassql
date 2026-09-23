[out:json][bbox:{{bbox}}];

//rel(5396194) -> .search_area;

//.search_area out skel geom;
//.search_area map_to_area -> .search_area;

(
	way/*(area.search_area)*/[man_made="bridge"];
	way/*(area.search_area)*/[bridge];
) -> .bridges;

way.bridges[highway!~"^(path|track|cycleway|footway|service|pedestrian)$"](if: length() >= 50) -> .bridges;

way(around.bridges:0)[waterway](if: length() <= 500) -> .waterways;
way.bridges(around.waterways:0) -> .bridges;

wr(around.bridges:10) -> .lands;
(
	wr.lands[natural][natural!="water"];
	wr.lands[landuse~"(grass|forest|meadow|cemetery|field)"];
) -> .lands;

way.bridges(around.lands:10) -> .bridges;
way.waterways(around.bridges:0) -> .waterways;

(
	.bridges;
	.waterways;
	.lands;
) -> .output;

(
	way.bridges[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	way.bridges[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

.output out geom;

way.bridges;
convert way ::id=id(), is_bridge="1";
out;

way.lands;
convert way ::id=id(), is_land="1";
out;

rel.lands;
convert relation ::id=id(), is_land="1";
out;

way.abandoned;
convert way ::id=id(), is_abandoned="1";
out;

{{style:
node, way, relation{
	color: #444444;
	fill-color: #888888;
}
node[waterway], way[waterway], relation[waterway]{
	color: #444488;
	fill-color: #8888cc;
}
node[is_bridge], way[is_bridge], relation[is_bridge]{
	color: #444400;
	fill-color: #ffff44;
}
node[is_bridge][is_abandoned], way[is_bridge][is_abandoned], relation[is_bridge][is_abandoned] {
	color: #004400;
	fill-color: #44ff44;
}
}}
