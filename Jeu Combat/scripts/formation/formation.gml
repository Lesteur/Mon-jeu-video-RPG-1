function formation(){
	form_choice = select_choice(form_choice, 1, false)
	
	if keyboard_check_pressed(vk_space) && menu[menu_i] == "formation" {
		if form_ally == "none" {
			form_ally = form_choice
			audio_play_sound(snd_select, 7, false)
		} else {
			var ally1 = global.team[form_ally]
			var ally2 = global.team[form_choice]
			if (turn == form_choice && ally1.statut == "KO") || (turn == form_ally && ally2.statut == "KO") {
				form_ally = "none"
				audio_play_sound(snd_false, 7, false)
			} else {
				global.team[form_ally] = ally2
				global.team[form_choice] = ally1
				audio_play_sound(snd_select, 7, false)
				form_ally = "none"
			}
		}
		audio_play_sound(snd_select, 7, false)
	}
	
	if keyboard_check_pressed(vk_enter) {
		if menu[menu_i] == "formation" {
			if global.team != form_team {
			menu_i ++
			menu[menu_i] = "formation_c"
			audio_play_sound(snd_select, 7, false)
			} else {
			menu_i --
			message_quick_t = 0
			form_ally = "none"
			}
		} else {
			dispo_team()
			menu_i -= 2
			form_turn = 2
			message_quick_t = 0
			form_ally = "none"
			audio_play_sound(snd_select, 7, false)
		}
	}
}