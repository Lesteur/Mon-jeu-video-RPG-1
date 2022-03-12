count ++

if count == 45 {
	image_speed = 0.8
	image_alpha = 1
	audio_play_sound(snd_ice, 6, false)
}

if image_index >= image_number - 1 {
	image_alpha = 0
	var o = 0
	repeat (8) {
		part_type_direction(global.ptIceblock, o, o, 0, 0)
		part_particles_create(global.partSystem100, x, y, global.ptIceblock, 1)
		o += 360/8
	}
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[0] = 50
	instance_destroy()
}