function formation() {
	choice_form = select_choice(choice_form, array_length(global.team)-1, false)
	cursor_i += 1/3
	
	if keyboard_check_pressed(vk_space) && menu[menu_i] == "formation" {
		if ally_form == noone {
			ally_form = choice_form
			audio_play_sound(snd_select, 7, false)
		} else {
			var ally1 = team_form[ally_form]
			var ally2 = team_form[choice_form]
			if (turn == choice_form && ally1.status == "KO") || (turn == ally_form && ally2.status == "KO") {
				ally_form = noone
				audio_play_sound(snd_false, 7, false)
			} else {
				team_form[ally_form] = ally2
				team_form[choice_form] = ally1
				audio_play_sound(snd_select, 7, false)
				ally_form = noone
			}
		}
		audio_play_sound(snd_select, 7, false)
	}
	
	if keyboard_check_pressed(vk_enter) {
		if menu[menu_i] == "formation" {
			if !array_equals(global.team, team_form) {
				menu_i ++
				menu[menu_i] = "formation_c"
				audio_play_sound(snd_select, 7, false)
			} else {
				menu_i --
				message_quick_t = 0
				ally_form = noone
			}
		} else {
			var array = []
			array_copy(array, 0, team_form, 0, array_length(team_form))
			global.team = array
			dispo_team()
			menu_i -= 2
			turn_form = 3
			message_quick_t = 0
			ally_form = noone
			choice_form = 0
			audio_play_sound(snd_select, 7, false)
		}
	}
}