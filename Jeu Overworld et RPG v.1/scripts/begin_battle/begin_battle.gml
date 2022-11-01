function begin_battle(team, team_enemy, param = {}){
	global.team = team
	global.team_enemy = team_enemy
	global.interact = 1
	global.fight = 1
	global.position = []
	for (var i = 0; i < array_length(global.team_player); i++) {
		var inst = global.team_player[i]
		global.position[i] = [inst.x, inst.y, inst.queue]
	}
	global.position_room = room
	global.player.targetRoom = room_battlefield_forest
	TransitionEffect(transition_fight_1)
	global.player.alarm[0] = 25
}