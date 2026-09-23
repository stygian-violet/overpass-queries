[out:json][bbox:{{bbox}}];

rel[boundary="administrative"](if: t["admin_level"] >= 4 && t["admin_level"] <= 6);

out body geom;
