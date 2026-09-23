[out:json];

rel(5396194) -> .search_area;

// Output search area boundary
// .search_area out skel geom;

.search_area map_to_area -> .search_area;

(
	// -- Actual abandoned object selectors --

	// See also: disused|demolished|razed
	nwr(area.search_area)[~"^(abandoned|collapsed|destroyed|ruin)"~"."];

	// This matches more objects than the rest of the selectors but times out
	// nwr(area.search_area)[~"."~"abandoned|collapsed|destroyed|ruin",i];

	// -- Mental disorders --

	nwr(area.search_area)[railway="abandoned"];
	nwr(area.search_area)[status="abandoned"];
	nwr(area.search_area)[building="abandoned"];
	nwr(area.search_area)[power="abandoned:tower"];
	nwr(area.search_area)[bridge="abandoned"];
	nwr(area.search_area)[power="abandoned"];
	nwr(area.search_area)[canal="abandoned"];
	nwr(area.search_area)[military="abandoned"];
	nwr(area.search_area)[building_status="abandoned"];
	nwr(area.search_area)[locality="abandoned_place"];
	nwr(area.search_area)[highway="abandoned"];
	nwr(area.search_area)[power="abandoned:line"];
	nwr(area.search_area)[construction="abandoned"];
	nwr(area.search_area)[landuse="abandoned"];
	nwr(area.search_area)[quarry="abandoned"];
	nwr(area.search_area)[electrified="abandoned"];
	nwr(area.search_area)[operational_status="abandoned"];
	nwr(area.search_area)[condition="abandoned"];
	nwr(area.search_area)[swimming_pool="abandoned"];
	nwr(area.search_area)[aerialway="abandoned"];
	nwr(area.search_area)[state="abandoned"];
	nwr(area.search_area)[place~"^abandoned"];
	nwr(area.search_area)[waterway="abandoned"];
	nwr(area.search_area)[shelter="abandoned"];

	nwr(area.search_area)[description~"abandoned|collapsed|ruin",i];
	nwr(area.search_area)[fixme~"abandoned|collapsed|ruin",i];
	nwr(area.search_area)[note~"abandoned|collapsed|ruin",i];

	nwr(area.search_area)[building="collapsed"];
	nwr(area.search_area)[~"damage"~"collapsed|destroyed"];
	nwr(area.search_area)[bridge="collapsed"];

	nwr(area.search_area)[building="ruin"];

	nwr(area.search_area)[building="ruined"];
	nwr(area.search_area)[condition="ruined"];

	nwr(area.search_area)[building="ruins"];
	nwr(area.search_area)[historic="ruins"];
	nwr(area.search_area)[archaeological_site="ruins"];
	nwr(area.search_area)["building:part"="ruins"];
	nwr(area.search_area)[landuse="ruins"];
	nwr(area.search_area)[bridge="ruins"];
	nwr(area.search_area)[man_made="ruins"];
	nwr(area.search_area)[wall="ruins"];
	nwr(area.search_area)["building:condition"="ruins"];
	nwr(area.search_area)[construction="ruins"];
	nwr(area.search_area)[castle="ruins"];
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
