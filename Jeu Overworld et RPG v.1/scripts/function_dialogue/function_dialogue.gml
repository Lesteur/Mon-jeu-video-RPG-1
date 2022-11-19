function function_dialogue(dialogue) {
	draw_set_font(Font)
	global.t ++
	var i = global.i
	var compte = global.compte
	var substr
	
	draw_sprite(sprite_box_dialogue, 0, 0, 280)
	
	if (array_length(dialogue[i]) > 1) {
		if dialogue[i][1] != 0 {
			
			draw_sprite(sprite_box_name, 0, 0, 211)
			draw_set_halign(fa_center)

			draw_set_colour(c_black)
			draw_text(74, 203, string_hash_to_newline(dialogue[i][1]))
			draw_set_color(c_white)
			draw_text(73, 202, string_hash_to_newline(dialogue[i][1]))
		}
	}

	if (array_length(dialogue[i]) > 2) {
		if dialogue[i][2] != 0 {
			draw_sprite_ext(dialogue[i][2], 0, 300, 206, 0.5, 0.5, 0, c_white, 1)
		}
	}

	if(compte < string_length(dialogue[i][0])) {
		global.compte ++
		if(compte mod 2 == 0) {
			audio_play_sound(snd_voice, 10, false)
		}
	}

	substr = string_copy(dialogue[i][0], 1, compte)

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_colour(c_black)

	draw_text_special(substr, 11, 231, 428, 19)

	if (keyboard_check_pressed(vk_space)) {
		if (compte == string_length(dialogue[i][0])) {
			global.i ++
			global.compte = 0
			global.t = 0
			room_speed = 30
		} else {
			global.compte = string_length(dialogue[i][0])
		}
	}

	if (array_length(dialogue[i]) > 3) && (compte == string_length(dialogue[i][0])) {
		room_speed = 30
		global.anima = global.anima + (1/3)

		draw_set_colour(c_black)
		draw_text(27, 270, string_hash_to_newline(dialogue[i][3][0]))
		draw_text(201, 270, string_hash_to_newline(dialogue[i][3][1]))
		
		draw_set_colour(c_white)
		draw_text(26, 269, string_hash_to_newline(dialogue[i][3][0]))
		draw_text(200, 269, string_hash_to_newline(dialogue[i][3][1]))
		
		if (global.reponse == 0) {
			draw_sprite(sprite_cursor, global.anima, 11, 266)
		} else {
			draw_sprite(sprite_cursor, global.anima, 185, 266)
		}

		if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) {
			if (global.reponse == 1) {
				global.reponse = 0
			} else {
				global.reponse = 1
			}
		}
		
		variable_instance_set(id, dialogue[i][4], global.reponse)
		
	}

}
