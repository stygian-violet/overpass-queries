[out:json][bbox:{{bbox}}];

(
	nwr[~"mortuary"~"."];
	nwr[~"amenity"~"mortuary"];
	nwr[building="mortuary"];
	nwr["church:type"="mortuary"];
	nwr["building:part"="mortuary"];
) -> .mortuaries;

(
	nwr[crematorium];
	nwr[~"amenity"~"crematorium"];
	nwr[building="crematorium"];
	nwr[animal="crematorium"];
	nwr[landuse="crematorium"];
) -> .crematoria;

(
	nwr[place_of_mourning];
	nwr[amenity=place_of_mourning];

	nwr[funeral_hall];
	nwr[amenity=funeral_hall];

	nwr[~"grave([^l]|$)"~"."];
	nwr[~"amenity"~"grave([^l]|$)"];
	nwr[man_made="grave"];
	nwr[landuse="grave_yard"];
	nwr[archaeological_site="grave_field"];
	nwr[building="grave_yard"];
	nwr[historic="grave_yard"];

	nwr[cemetery];
	nwr[landuse="cemetery"];
	nwr[denotation="cemetery"];
	nwr[historic="cemetery"];
	nwr["church:type"="cemetery"];
	nwr[animal="cemetery"];

	nwr[tomb];
	nwr[historic="tomb"];
	nwr[building="tomb"];
	nwr[man_made="tomb"];
	nwr[archaeological_site="tomb"];
	nwr[memorial="tomb"];
	nwr[ruins="tomb"];

	nwr[tumulus];
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
