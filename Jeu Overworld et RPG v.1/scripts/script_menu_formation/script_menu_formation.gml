function script_menu_formation() {
	choice_form = select_choice(choice_form, array_length(global.team_v)-1, false)
	cursor_i += 1/3
	
	if keyboard_check_pressed(vk_space) && menu[menu_i] == "formation_team" {
		if ally_form == noone {
			ally_form = choice_form
			audio_play_sound(snd_select, 7, false)
		} else {
			var ally1 = team_form[ally_form]
			var ally2 = team_form[choice_form]
			team_form[ally_form] = ally2
			team_form[choice_form] = ally1
			audio_play_sound(snd_select, 7, false)
			ally_form = noone
		}
		audio_play_sound(snd_select, 7, false)
	}
	
	if keyboard_check_pressed(vk_enter) {
		var array = []
		array_copy(array, 0, team_form, 0, array_length(team_form))
		global.team_v = array
		menu_i --
		ally_form = noone
		choice_form = 0
		Obj_manager.chang_team = true
		audio_play_sound(snd_select, 7, false)
	}
}