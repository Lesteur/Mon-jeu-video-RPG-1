count++

image_angle = direct
part_type_orientation(global.part_Fireball, direct, direct, 0, 0, 0)

if count >= 45 {
	if count == 45 {
		audio_play_sound(snd_strong_attack1, 6, false)
	}
	image_alpha = 1
	x += lengthdir_x(15, direct)
	y += lengthdir_y(15, direct)
	len -= 15
	part_particles_create(global.partSystem100, x, y, global.part_Fireball, 1)
}

if len <= 0 and count >= 30 {
	var o = 0
	repeat (10) {
		part_type_direction(global.part_Explosion, o, o, 0, 0)
		part_particles_create(global.partSystem100, cible.x, cible.y, global.part_Explosion, 1)
		o += 360/10
	}
	Obj_manager_fight.alarm[1] = 1
	Obj_manager_fight.alarm[0] = 50
	instance_destroy()
}