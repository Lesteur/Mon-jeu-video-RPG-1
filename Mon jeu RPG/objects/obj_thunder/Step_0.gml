count ++

if count >= 40 {
	image_speed = 0.8
	image_alpha = 1
	part_particles_create(global.partSystem100, x+irandom_range(-50, 50), y+irandom_range(-50, 50), global.ptThunder, 1)
}

if count == 40 {
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[0] = 70
}

if count >= 60 {
	Obj_manager_fight.flashAlpha = 1
	instance_destroy()
}