if Obj_Arthur.image_index == 6 {
	count = 1
	image_angle = direct
}

//part_type_orientation(global.part_Fireball, direct, direct, 0, 0, 0)

if Obj_manager_fight.alarm[1] == 0 {
	instance_destroy()
}

if count >= 1 {//45 {
	x += lengthdir_x(20, direct)
	y += lengthdir_y(20, direct)
	len -= 20
	//part_particles_create(global.partSystem100, x, y, global.part_Fireball, 1)
}

if len <= 0 and count >= 1 {//30 {
	audio_play_sound(snd_hurt, 6, false)
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[0] = 70
	instance_destroy()
}
