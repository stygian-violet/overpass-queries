[out:json][bbox:{{bbox}}];

(
	nwr[~"radio"~"."](if: !is_tag("railway") || t["railway"] == "radio");
	nwr[landuse="radio"];
	nwr[studio="radio"];
	nwr["telescope:type"="radio"];
	nwr["telescope:spectrum"="radio"];
	nwr["tower:type"="radio"];
	nwr["seamark:type"="radio_station"];
	nwr["seamark:landmark:function"="radio"];
	nwr[telecommunication="radio"];
	nwr[communication="radio"];
	nwr[communication="amateur_radio"];
	nwr[~"airmark$"~"."];
	nwr[man_made="satellite_dish"];
	nwr[~"antenna"~"."];
	nwr[man_made="antenna"];
	nwr[tower_type="antenna"];
	nwr["building:part"="antenna"];
	nwr[building="antenna"];
	nwr[club="amateur_radio"];
	nwr[club="ham_radio"];
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
