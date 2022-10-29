function begin_battle(team, team_enemy, param = {}){
	global.team = team
	global.team_enemy = team_enemy
	global.interact = 1
	global.position.x = Obj_player.x
	global.position.x = Obj_player.y
	Obj_player.targetRoom = room_battlefield_forest
	Obj_manager.fade = 0.01
	Obj_manager.fadeDirection = 1
	Obj_player.alarm[0] = 25
}