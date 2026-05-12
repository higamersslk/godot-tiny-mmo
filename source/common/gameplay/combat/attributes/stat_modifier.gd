class_name StatModifier
extends Resource


@export_enum(
	Stat.HEALTH_MAX,
	Stat.MANA_MAX,
	Stat.ARMOR,
	Stat.MR,
	Stat.AD,
	Stat.MOVE_SPEED
)
var stat_name: String = Stat.HEALTH_MAX

@export var value: float = 0.0
