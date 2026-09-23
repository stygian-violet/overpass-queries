[out:json];

rel(148838) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	// All hazards, including animal crossings, school zones, road curves, etc.
	// nwr(area.search_area)[boundary="hazard"];
	// nwr(area.search_area)[hazard];

	// More interesting hazards
	nwr(area.search_area)[hazard="ammunition"];
	nwr(area.search_area)[hazard="archery_range"];
	nwr(area.search_area)[hazard="avalanche"];
	nwr(area.search_area)[hazard="bees"];
	nwr(area.search_area)[hazard="biohazard"];
	nwr(area.search_area)[hazard="cliff"];
	nwr(area.search_area)[hazard="contamination"];
	nwr(area.search_area)[hazard="electricity"];
	nwr(area.search_area)[hazard="explosive_atmosphere"];
	nwr(area.search_area)[hazard="falling_rocks"];
	nwr(area.search_area)[hazard="falling_trees"];
	nwr(area.search_area)[hazard="flood"];
	nwr(area.search_area)[hazard="fog"];
	nwr(area.search_area)[hazard="hole"];
	nwr(area.search_area)[hazard="landslide"];
	nwr(area.search_area)[hazard="leeches"];
	nwr(area.search_area)[hazard="low_flying_aircraft"];
	nwr(area.search_area)[hazard="minefield"];
	nwr(area.search_area)[hazard="nuclear"];
	nwr(area.search_area)[hazard="quicksand"];
	nwr(area.search_area)[hazard="robot"];
	nwr(area.search_area)[hazard="shooting_range"];
	nwr(area.search_area)[hazard="side_winds"];
	nwr(area.search_area)[hazard="toxic_plant"];
	nwr(area.search_area)[hazard="unexploded_ordnance"];
) -> .all;

(
	nwr.all[~"^(abandoned|collapsed|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|destroyed|disused|razed|ruin", i];
) -> .abandoned;

.all out geom;

node.abandoned;
convert node ::id=id(), is_abandoned="1";
out;
way.abandoned;
convert way ::id=id(), is_abandoned="1";
out;
rel.abandoned;
convert relation ::id=id(), is_abandoned="1";
out;

{{style:
node, way, relation{
	color: #331133;
	fill-color: #cc44cc;
}
node[hazard=ammunition], way[hazard=ammunition], relation[hazard=ammunition], node[hazard=shooting_range], way[hazard=shooting_range], relation[hazard=shooting_range], node[hazard=unexploded_ordnance], way[hazard=unexploded_ordnance], relation[hazard=unexploded_ordnance] {
	color: #ff4444;
	fill-color: #ffff00;
}
node[hazard=archery_range], way[hazard=archery_range], relation[hazard=archery_range] {
	color: #ff4444;
	fill-color: #9f784f;
}
node[hazard=avalanche], way[hazard=avalanche], relation[hazard=avalanche] {
	color: #444488;
	fill-color: #ddddff;
}
node[hazard=bees], way[hazard=bees], relation[hazard=bees] {
	color: #ffff44;
	fill-color: #9f784f;
}
node[hazard=biohazard], way[hazard=biohazard], relation[hazard=biohazard] {
	color: #335522;
	fill-color: #ccffaa;
}
node[hazard=cliff], way[hazard=cliff], relation[hazard=cliff] {
	color: #442211;
	fill-color: #666644;
}
node[hazard=contamination], way[hazard=contamination], relation[hazard=contamination] {
	color: #226622;
	fill-color: #ccee22;
}
node[landuse=cattlegrave], way[landuse=cattlegrave], relation[landuse=cattlegrave] {
	color: #334422;
	fill-color: #bbccaa;
}
node[hazard=electricity], way[hazard=electricity], relation[hazard=electricity] {
	color: #222244;
	fill-color: #8888ff;
}
node[hazard=explosive_atmosphere], way[hazard=explosive_atmosphere], relation[hazard=explosive_atmosphere]{
	color: #ffaaaa;
	fill-color: #eeeeff;
}
node[hazard=falling_rocks], way[hazard=falling_rocks], relation[hazard=falling_rocks] {
	color: #882200;
	fill-color: #775500;
}
node[hazard=falling_trees], way[hazard=falling_trees], relation[hazard=falling_trees] {
	color: #882200;
	fill-color: #007755;
}
node[hazard=flood], way[hazard=flood], relation[hazard=flood] {
	color: #000044;
	fill-color: #2222ff;
}
node[hazard=fog], way[hazard=fog], relation[hazard=fog] {
	color: #222244;
	fill-color: #eeeeff;
}
node[hazard=hole], way[hazard=hole], relation[hazard=hole] {
	color: #888888;
	fill-color: #000000;
}
node[hazard=landslide], way[hazard=landslide], relation[hazard=landslide] {
	color: #553300;
	fill-color: #aa8800;
}
node[hazard=leeches], way[hazard=leeches], relation[hazard=leeches]{
	color: #665544;
	fill-color: #cc9988;
}
node[hazard=low_flying_aircraft], way[hazard=low_flying_aircraft], relation[hazard=low_flying_aircraft] {
	color: #440000;
	fill-color: #aa0000;
}
node[hazard=minefield], way[hazard=minefield], relation[hazard=minefield] {
	color: #000000;
	fill-color: #ff4444;
}
node[hazard=nuclear], way[hazard=nuclear], relation[hazard=nuclear] {
	color: #000000;
	fill-color: #ffff00;
}
node[hazard=quicksand], way[hazard=quicksand], relation[hazard=quicksand] {
	color: #ff4444;
	fill-color: #775500;
}
node[hazard=robot], way[hazard=robot], relation[hazard=robot]{
	color: #444455;
	fill-color: #ccccdd;
}
node[hazard=side_winds], way[hazard=side_winds], relation[hazard=side_winds]{
	color: #222266;
	fill-color: #ddddff;
}
node[hazard=toxic_plant], way[hazard=toxic_plant], relation[hazard=toxic_plant] {
	color: #226622;
	fill-color: #66ee88;
}
node[is_abandoned], way[is_abandoned], relation[is_abandoned] {
	color: #004444;
	fill-color: #44ffff;
}
}}
