[out:json];

rel(62149) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	nwr(area.search_area)[~"lighthouse"~"."];
	nwr(area.search_area)[man_made="lighthouse"];
	nwr(area.search_area)[building="lighthouse"];
	nwr(area.search_area)[historic="lighthouse"];
	nwr(area.search_area)[~"man_made$"~"^lighthouse$"];
	// nwr(area.search_area)["abandoned:man_made"="lighthouse"];
	// nwr(area.search_area)["disused:man_made"="lighthouse"];
	// nwr(area.search_area)["was:man_made"="lighthouse"];
	nwr(area.search_area)["building:part"="lighthouse"];
) -> .lighthouses;

(
	nwr(area.search_area)[man_made="beacon"][!airmark];
	nwr(area.search_area)[seamark="beacon"];
	nwr(area.search_area)["seamark:type"~"beacon"];
) -> .beacons;

( .lighthouses; .beacons; ) -> .all;

(
	nwr.all[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

node.abandoned;
convert node ::id=id(), is_abandoned="1";
out;
way.abandoned;
convert way ::id=id(), is_abandoned="1";
out;
rel.abandoned;
convert relation ::id=id(), is_abandoned="1";
out;

node.beacons;
convert node ::id=id(), is_beacon="1";
out;
way.beacons;
convert way ::id=id(), is_beacon="1";
out;
rel.beacons;
convert relation ::id=id(), is_beacon="1";
out;

.all out geom;

{{style:
node, way, relation{
	color: #444400;
	fill-color: #ffff44;
}
node[is_beacon], way[is_beacon], relation[is_beacon] {
	color: #000044;
	fill-color: #4444ff;
}
node[is_abandoned], way[is_abandoned], relation[is_abandoned] {
	color: #004400;
	fill-color: #44ff44;
}
}}
