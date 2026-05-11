extends DataRequestHandler


func data_request_handler(
	peer_id: int,
	instance: ServerInstance,
	args: Dictionary
) -> Dictionary:
	var player: Player = instance.players_by_peer_id.get(peer_id, null)
	if not player:
		return {}
	player.player_resource.available_attributes_points += 1
	if player.player_resource.available_attributes_points > 0:
		var gained_stats: Dictionary = AttributeMap.attr_to_stats({args["attr"]: 1})
		var value: float
		for stat_name: StringName in gained_stats:
			value = player.stats_component.get_stat(stat_name)
			value += gained_stats[stat_name]
			player.stats_component.set_stat(stat_name, value)
		player.player_resource.available_attributes_points -= 1
		return {"spent": -1}
	return {}
