function formation(){
	choice_form = select_choice(choice_form, array_length(team_a)-1, false)
	cursor_i += 1/3
	
	if keyboard_check_pressed(vk_space) && menu[menu_i] == "formation" {
		if ally_form == noone {
			ally_form = choice_form
			audio_play_sound(snd_select, 7, false)
		} else {
			var ally1 = global.team[ally_form]
			var ally2 = global.team[choice_form]
			if (turn == choice_form && ally1.status == "KO") || (turn == ally_form && ally2.status == "KO") {
				ally_form = noone
				audio_play_sound(snd_false, 7, false)
			} else {
				global.team[ally_form] = ally2
				global.team[choice_form] = ally1
				audio_play_sound(snd_select, 7, false)
				ally_form = noone
			}
		}
		audio_play_sound(snd_select, 7, false)
	}
	
	if keyboard_check_pressed(vk_enter) {
		if menu[menu_i] == "formation" {
			if global.team != team_form {
				menu_i ++
				menu[menu_i] = "formation_c"
				audio_play_sound(snd_select, 7, false)
			} else {
				menu_i --
				message_quick_t = 0
				ally_form = noone
			}
		} else {
			dispo_team()
			menu_i -= 2
			turn_form = 2
			message_quick_t = 0
			ally_form = noone
			audio_play_sound(snd_select, 7, false)
		}
	}
}