[out:json];

rel(5396194) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

(
	nwr(area.search_area)[~"radio"~"."](if: !is_tag("railway") || t["railway"] == "radio");
	nwr(area.search_area)[landuse="radio"];
	nwr(area.search_area)[studio="radio"];
	nwr(area.search_area)["telescope:type"="radio"];
	nwr(area.search_area)["telescope:spectrum"="radio"];
	nwr(area.search_area)["tower:type"="radio"];
	nwr(area.search_area)["seamark:type"="radio_station"];
	nwr(area.search_area)["seamark:landmark:function"="radio"];
	nwr(area.search_area)[telecommunication="radio"];
	nwr(area.search_area)[communication="radio"];
	nwr(area.search_area)[communication="amateur_radio"];
	nwr(area.search_area)[~"airmark$"~"."];
	nwr(area.search_area)[man_made="satellite_dish"];
	nwr(area.search_area)[~"antenna"~"."];
	nwr(area.search_area)[man_made="antenna"];
	nwr(area.search_area)[tower_type="antenna"];
	nwr(area.search_area)["building:part"="antenna"];
	nwr(area.search_area)[building="antenna"];
	nwr(area.search_area)[club="amateur_radio"];
	nwr(area.search_area)[club="ham_radio"];
) -> .all;

(
	nwr.all[~"(amateur|ham)_?radio"~"."];
	nwr.all["antenna:type"="ham_radio"];
	nwr.all[communication="amateur_radio"];
	nwr.all[club="amateur_radio"];
	nwr.all[club="ham_radio"];
) -> .amateur;

(
	nwr.all[~"antenna"~"."];
	nwr.all[man_made="antenna"];
	nwr.all[tower_type="antenna"];
	nwr.all["building:part"="antenna"];
	nwr.all[building="antenna"];
) -> .antennae;

(
	nwr.all[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

.all out geom;

node.amateur;
convert node ::id=id(), is_amateur="1";
out;
way.amateur;
convert way ::id=id(), is_amateur="1";
out;
rel.amateur;
convert relation ::id=id(), is_amateur="1";
out;

node.antennae;
convert node ::id=id(), is_antenna="1";
out;
way.antennae;
convert way ::id=id(), is_antenna="1";
out;
rel.antennae;
convert relation ::id=id(), is_antenna="1";
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

{{style:
node, way, relation{
	color: #444400;
	fill-color: #ffff00;
}
node[is_antenna], way[is_antenna], relation[is_antenna]{
	color: #333322;
	fill-color: #ccccaa;
}
node[is_amateur], way[is_amateur], relation[is_amateur] {
	color: #000044;
	fill-color: #0000ff;
}
node[is_abandoned], way[is_abandoned], relation[is_abandoned] {
	color: #004400;
	fill-color: #00ff00;
}
}}
