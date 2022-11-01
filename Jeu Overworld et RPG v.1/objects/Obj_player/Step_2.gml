// Find exit trigger
var _exit = instance_place(x, y, Obj_exit)

// Exit room
if ( _exit != noone && alarm[0] < 0) {
	global.interact = 1
	targetRoom = _exit.targetRoom
	TransitionEffect("in")
	alarm[0] = 25
	Obj_manager.targetInstance = _exit.targetInstance
}