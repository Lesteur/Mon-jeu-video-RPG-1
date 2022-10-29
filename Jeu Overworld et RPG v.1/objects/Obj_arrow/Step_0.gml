if player.image_index == 6 {
	count = 1
	image_angle = direct
}

if Obj_manager_fight.alarm[1] == 0 {
	instance_destroy()
}

if count >= 1 {//45 {
	x += lengthdir_x(20, direct)
	y += lengthdir_y(20, direct)
	len -= 20
}

if len <= 0 and count >= 1 {
	audio_play_sound(snd_hurt, 6, false)
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[3] = 65
	instance_destroy()
}
