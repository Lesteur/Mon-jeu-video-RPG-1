count ++

if count >= 45 {
	image_speed = 0.8
	image_alpha = 1
	part_particles_create(global.partSystem100, x+irandom_range(-50, 50), y+irandom_range(-50, 50), global.ptThunder, 1)
}

if count == 45 {
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[0] = 50
}

if count >= 60 {
	instance_destroy()
}