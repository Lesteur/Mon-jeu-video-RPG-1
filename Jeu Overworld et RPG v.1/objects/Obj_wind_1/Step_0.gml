count ++

if count == 40 {
	image_speed = 2
	image_alpha = 1
	owner.animation = 1
	audio_play_sound(snd_ice, 6, false)
}

if image_index >= image_number - 1 {
	image_alpha = 0
	part_type_sprite(global.part_attack, effect_wind_1_2, true, true, false)
	var spd = sprite_get_speed(effect_wind_1_2)/2
	part_type_life(global.part_attack, spd, spd)
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[3] = 65
	instance_destroy()
}