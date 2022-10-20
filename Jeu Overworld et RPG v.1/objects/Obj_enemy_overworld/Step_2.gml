// Find enemy
var _enemy = instance_place(x, y, Obj_player)

// Exit room
if ( _enemy != noone && Obj_player.alarm[1] < 0) {
	global.interact = 1
	global.position.x = Obj_player.x
	global.position.x = Obj_player.y
	Obj_player.targetRoom = room_battlefield_forest
	Obj_manager.fade = 0.01
	Obj_manager.fadeDirection = 1
	Obj_player.alarm[1] = 25
	instance_destroy()
	//Obj_manager.targetInstance = _exit.targetInstance
}