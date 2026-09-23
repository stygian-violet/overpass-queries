[out:json][bbox:{{bbox}}];

(
	// -- Actual abandoned object selectors --

	// See also: disused|demolished|razed
	nwr[~"^(abandoned|collapsed|destroyed|ruin)"~"."];

	// This matches more objects than the rest of the selectors but times out
	// nwr[~"."~"abandoned|collapsed|destroyed|ruin",i];

	// -- Mental disorders --

	nwr[railway="abandoned"];
	nwr[status="abandoned"];
	nwr[building="abandoned"];
	nwr[power="abandoned:tower"];
	nwr[bridge="abandoned"];
	nwr[power="abandoned"];
	nwr[canal="abandoned"];
	nwr[military="abandoned"];
	nwr[building_status="abandoned"];
	nwr[locality="abandoned_place"];
	nwr[highway="abandoned"];
	nwr[power="abandoned:line"];
	nwr[construction="abandoned"];
	nwr[landuse="abandoned"];
	nwr[quarry="abandoned"];
	nwr[electrified="abandoned"];
	nwr[operational_status="abandoned"];
	nwr[condition="abandoned"];
	nwr[swimming_pool="abandoned"];
	nwr[aerialway="abandoned"];
	nwr[state="abandoned"];
	nwr[place~"^abandoned"];
	nwr[waterway="abandoned"];
	nwr[shelter="abandoned"];

	nwr[description~"abandoned|collapsed|ruin",i];
	nwr[fixme~"abandoned|collapsed|ruin",i];
	nwr[note~"abandoned|collapsed|ruin",i];

	nwr[building="collapsed"];
	nwr[~"damage"~"collapsed|destroyed"];
	nwr[bridge="collapsed"];

	nwr[building="ruin"];

	nwr[building="ruined"];
	nwr[condition="ruined"];

	nwr[building="ruins"];
	nwr[historic="ruins"];
	nwr[archaeological_site="ruins"];
	nwr["building:part"="ruins"];
	nwr[landuse="ruins"];
	nwr[bridge="ruins"];
	nwr[man_made="ruins"];
	nwr[wall="ruins"];
	nwr["building:condition"="ruins"];
	nwr[construction="ruins"];
	nwr[castle="ruins"];
) -> .abandoned;

// -- Output only points for better performance as a map overlay --

/*
// Output endpoints and crossings of long non-closed ways
way.abandoned(if: !is_closed() && length() > 20) -> .long;
foreach.long->.l(
	( node(way_link.l:1); node(way_link.l:3-); );
	out;
	convert node ::id=id(), way_id=l.u(id()), l::=l.u(::);
	out;
);
(.abandoned; - .long;) -> .abandoned;

// Output centers of everything else
.abandoned out geom center;
*/

// -- Output full geometry --

// (.abandoned; .abandoned >>;) -> .abandoned;
.abandoned out geom;

// TODO: color by type

{{style:
/*node, way, relation {
	color: #0033ff;
	fill-color: #ffcc00;
}*/
}}
