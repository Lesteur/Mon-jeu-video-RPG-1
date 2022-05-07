function select_charac(team) {
	
	if target >= array_length(team_target) {
		target = 0
	}
	
	if keyboard_check_pressed(vk_up) && array_length(team) > 1 {
		target --
		if target < 0 {
			target = array_length(team) - 1
		}
		
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(vk_down) && array_length(team) > 1 {
		target ++
		if target >= array_length(team) {
			target = 0
		}
		
		audio_play_sound(snd_movemenu, 5, false)
	}
}

function select_choice(variable, number, direction) {
	
	if direction {
		var dir_1 = vk_left
		var dir_2 = vk_right
	} else {
		var dir_1 = vk_up
		var dir_2 = vk_down
	}
	
	if keyboard_check_pressed(dir_1) && number > 0 {
		variable -= 1
		if variable < 0 {
			variable = number
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_2) && number > 0 {
		variable += 1
		if variable > number {
			variable = 0
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	return variable
	
}

function text_sha(x, y, str, color) {
	if color == undefined {
		color = c_white
	}
	draw_set_color(c_black)
	draw_text(x+2, y+2, str)
	draw_set_color(color)
	draw_text(x, y, str)
}
