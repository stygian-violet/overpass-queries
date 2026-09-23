[out:json];

rel(148838) -> .search_area;

// .search_area out skel geom;
.search_area map_to_area -> .search_area;

nwr(area.search_area)
	(if: t["amenity"] == "atm"
		|| t["amenity"] == "payment_terminal"
		|| (is_tag("atm") && t["atm"] != "no"))
	[~"^currency:(BTH|DOGE|ETH|LTC|TON|USDC|USDT|XBT|XMR|crypto)$"~"^[^n]"]
	-> .all;

(
	nwr.all[cash_in][cash_in!="no"];
	nwr.all["payment:cash"]["payment:cash"!="no"];
) -> .cash;

node.cash;
convert node ::id=id(), can_deposit_cash="1";
out;
way.cash;
convert way ::id=id(), can_deposit_cash="1";
out;
rel.cash;
convert relation ::id=id(), can_deposit_cash="1";
out;

(
	nwr.all[cash_out][cash_out!="no"];
	nwr.all[cash_withdrawal][cash_withdrawal!="no"];
) -> .cash;

node.cash;
convert node ::id=id(), can_withdraw_cash="1";
out;
way.cash;
convert way ::id=id(), can_withdraw_cash="1";
out;
rel.cash;
convert relation ::id=id(), can_withdraw_cash="1";
out;

.all out geom;

{{style:
node, way, relation{
	color: #331133;
	fill-color: #cc44cc;
}
node[can_deposit_cash], way[can_deposit_cash], relation[can_deposit_cash]{
	color: #444400;
	fill-color: #ffff44;
}
node[can_withdraw_cash], way[can_withdraw_cash], relation[can_withdraw_cash]{
	color: #004444;
	fill-color: #44ffff;
}
node[can_deposit_cash][can_withdraw_cash], way[can_deposit_cash][can_withdraw_cash], relation[can_deposit_cash][can_withdraw_cash]{
	color: #004400;
	fill-color: #44ff44;
}
}}
