// Find exit trigger
var _exit = instance_place(x, y, Obj_exit)

// Exit room
if ( _exit != noone && alarm[0] < 0) {
	global.interact = 1
	targetRoom = _exit.targetRoom
	Obj_manager.fade = 0.01
	Obj_manager.fadeDirection = 1
	alarm[0] = 25
	Obj_manager.targetInstance = _exit.targetInstance
}