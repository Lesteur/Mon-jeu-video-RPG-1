count ++

if count >= 40 {
	image_speed = 1
	image_alpha = 1
}

if count == 40 {
	Obj_manager_fight.flashAlpha = 1
	owner.animation = 1
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[3] = 65
}

if count >= 60 {
	instance_destroy()
}