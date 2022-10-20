function player_overworld() {
	var moveH, moveV, key_right, key_left, key_up, key_down, key_D, hsp, vsp

	// Récupération touches clavier

	key_left = keyboard_check(vk_left)
	key_right = keyboard_check(vk_right)
	key_up = keyboard_check(vk_up)
	key_down = keyboard_check(vk_down)
	key_D = keyboard_check(ord("D"))

	// Mouvements du joueur

	moveH = key_right - key_left

	hsp = moveH * movesp

	moveV = key_down - key_up

	vsp = moveV * movesp

	if (key_right && !place_meeting( x + movesp, y, Obj_collision)) || (key_left && !place_meeting( x - movesp, y, Obj_collision)) {
		x += hsp
	}

	if (key_up && !place_meeting( x, y - movesp, Obj_collision)) || (key_down && !place_meeting( x, y + movesp, Obj_collision)) {
		y += vsp
	}

	if key_D {
		movesp = 5
	} else {
		movesp = 2
	}

	// Animations du joueur

	if (hsp == 0) && (vsp == 0) {
		image_speed = 0
		image_index = 0
	} else {
		if (movesp == 2) {
			image_speed = 0.15
		} else {
			image_speed = 0.30
		}
	}

	if key_up && (hsp == 0) {
		sprite_index = sprite_walk_top
	}
	if key_down && (hsp == 0) {
		sprite_index = sprite_walk_bottom
	}
	if key_right && (vsp == 0) {
		sprite_index = sprite_walk_right
	}
	if key_left && (vsp == 0) {
		sprite_index = sprite_walk_left
	}

	if (vsp < 0) && (sprite_index == sprite_walk_bottom) {
		sprite_index = sprite_walk_top
	}
	if (vsp > 0) && (sprite_index == sprite_walk_top) {
		sprite_index = sprite_walk_bottom
	}
	if (hsp > 0) && (sprite_index == sprite_walk_left) {
		sprite_index = sprite_walk_right
	}
	if (hsp < 0) && (sprite_index == sprite_walk_right) {
		sprite_index = sprite_walk_left
	}

	if keyboard_check_pressed(ord("S")) {
		ini_open("Jeu.ini")
		ini_write_real("Progression", "Position_x", x)
		ini_write_real("Progression", "Position_y", y)
		ini_close()
	}

	if (keyboard_check_pressed(ord("L"))) {
		ini_open("Jeu.ini")
		x = ini_read_real("Progression", "Position_x", 0)
		y = ini_read_real("Progression", "Position_y", 0)
		ini_close()
	}
	
	//window_resize()

}
