count ++

if count == 40 {
	image_speed = 2
	image_alpha = 1
	owner.animation = 1
	audio_play_sound(snd_ice, 6, false)
}

if image_index >= image_number - 1 {
	image_alpha = 0
	var o = 0
	repeat (8) {
		part_type_direction(global.part_Snowflake, o, o, 0, 0)
		part_particles_create(global.partSystem100, x, y-16, global.part_Snowflake, 1)
		o += 45
	}
	part_particles_create(global.partSystem100, x, y-16, global.part_Snowflake, 1)
	Obj_manager_fight.flashAlpha = 1
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[3] = 65
	instance_destroy()
}