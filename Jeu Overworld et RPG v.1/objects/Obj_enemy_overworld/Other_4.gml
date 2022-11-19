if Obj_manager.targetInstance != noone {
	x = begin_x
	y = begin_y
}

if global.resume[0] == id {
	if global.resume[1] == 1 {
		instance_destroy()
	} else if global.resume[1] == 3 {
		count = 0
		state = states.paralys
	}
}