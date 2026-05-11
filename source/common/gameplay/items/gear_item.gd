class_name GearItem
extends Item


@export var slot: ItemSlot
@export_range(0, 99, 1.0, "suffix:lvl") var required_level: int = 0

## Main Stats (Base stats)
@export var base_modifiers: Array[StatModifier]


func can_equip(player: Player) -> bool:
	if player.player_resource:
		return slot.is_unlocked_for(player.player_resource) and player.player_resource.level >= required_level
	return false


func equip(character: Character) -> void:
	for modifier: StatModifier in base_modifiers:
		character.stats_component.modify_stat(
			modifier.stat_name, modifier.value
		)


func unequip(character: Character) -> void:
	for modifier: StatModifier in base_modifiers:
		character.stats_component.modify_stat(
			modifier.stat_name, modifier.value * -1
		)
