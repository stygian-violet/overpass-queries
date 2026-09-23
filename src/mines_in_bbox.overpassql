[out:json][bbox:{{bbox}}];

(
	nwr[~"quarry|mine(_|shaft)"~"."];
	nwr[~"landuse"~"quarry|mine"];

	nwr[historic~"quarry|mine"];
	nwr[industrial~"quarry|mine"];

	nwr[disused="quarry"];
	nwr[man_made="mine"];
	nwr[survey_point="mine"];
	nwr[type="mine_shaft"];
) -> .all;

(
	nwr.all[~"^(abandoned|collapsed|demolished|destroyed|disused|razed|ruin)"~"."];
	nwr.all[~"."~"abandoned|collapsed|demolished|destroyed|disused|razed|ruin", i];
) -> .abandoned;

nwr.all[historic] -> .historic;

node.historic;
convert node ::id=id(), is_historic="1";
out;
way.historic;
convert way ::id=id(), is_historic="1";
out;
rel.historic;
convert relation ::id=id(), is_historic="1";
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
node, way, relation {
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
