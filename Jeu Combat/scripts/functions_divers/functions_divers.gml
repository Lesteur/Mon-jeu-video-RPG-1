function select_charac(team) {
	
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

function dispo_team() {
	for (var i = 0; i<array_length(global.team); i++) {
		var char = global.team[i]
		char.x = 90 - i*20
		char.y = 80 + i*20
		char.depth = 40 - i*10
	}
}

function lower_boosts(team) {
	for (var i = 0; i < array_length(team); i++) {
		for (var a= 0; a < array_length(team[i].boost); a++) {
			team[i].boost[a][1] --
			if team[i].boost[a][1] <= 0 {
				team[i].boost[a][1] = 0
				team[i].boost[a][0] = 1
			}
		}
	}
}