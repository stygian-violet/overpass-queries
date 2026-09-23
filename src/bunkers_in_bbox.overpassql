[out:json][bbox:{{bbox}}];

(
	nwr[~"bunker"~"."];
	nwr[military="bunker"];
	nwr[building="bunker"];
	nwr[historic="bunker"];
	nwr[ruins="bunker"];
	nwr[man_made="bunker"];
	nwr["building:part"="bunker"];
	nwr[abandoned="bunker"];

	// Times out
	// nwr[~"building|military"~"bunker"];

	nwr["abandoned:military"="bunker"];
	nwr["demolished:military"="bunker"];
	nwr["destroyed:military"="bunker"];
	nwr["disused:military"="bunker"];
	nwr["razed:military"="bunker"];
	nwr["removed:military"="bunker"];
	nwr["ruins:military"="bunker"];
	nwr["was:military"="bunker"];

	nwr["abandoned:building"="bunker"];
	nwr["demolished:building"="bunker"];
	nwr["destroyed:building"="bunker"];
	nwr["disused:building"="bunker"];
	nwr["razed:building"="bunker"];
	nwr["removed:building"="bunker"];
	nwr["ruins:building"="bunker"];
	nwr["was:building"="bunker"];
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
