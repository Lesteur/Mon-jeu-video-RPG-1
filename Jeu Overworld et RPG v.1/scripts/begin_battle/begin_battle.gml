function begin_battle(team, team_enemy, param = {}){
	global.team = []
	array_copy(global.team, 0, team, 0, array_length(team))
	global.team_enemy = team_enemy
	global.param_fight = param
	global.interact = 1
	global.fight = 1
	global.position = []
	for (var i = 0; i < array_length(global.team_player); i++) {
		var inst = global.team_player[i]
		global.position[i] = [inst.x, inst.y, inst.queue]
	}
	global.position_room = room
	global.player.targetRoom = room_battlefield_forest
	global.resume[0] = id
	TransitionEffect(transition_fight_1)
	global.player.alarm[0] = 25
}