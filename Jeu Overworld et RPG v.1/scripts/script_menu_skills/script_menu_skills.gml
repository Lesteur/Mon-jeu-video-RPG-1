function script_menu_skills() {
	
	switch(submenu[submenu_i]) {
	case "select_characters":
		choice_options1 = select_choice(choice_options1, array_length(global.team_v)-1, true)
		if keyboard_check_pressed(vk_space) {
			submenu_i ++
			submenu[submenu_i] = "options_skills"
			choice_objets = 0
			struct_options1 = []
			struct_options2 = global.team_v[choice_options1]
			var player = global.team_v[choice_options1]
			for (var i = 0; i < array_length(player.skills); i++) {
				if player.skills[i].utilisation == 1 || player.skills[i].utilisation == 2 {
					array_push(struct_options1, player.skills[i])
				}
			}
		}
		break
	case "options_skills":
		choice_options2 = select_choice(choice_options2, 4, false)
		if keyboard_check_pressed(vk_space) {
			choice_objets = 0
			switch(choice_options2) {
			case 0:
				audio_play_sound(snd_select, 4, false)
				submenu_i ++
				submenu[submenu_i] = "see_skills"
				break
			case 1:
				if array_length(struct_options1) {
					audio_play_sound(snd_select, 4, false)
					submenu_i ++
					submenu[submenu_i] = "use_skills"
					submenu[submenu_i+1] = "use_skills_char"
				} else {
					audio_play_sound(snd_false, 4, false)
				}
				break
			}
		}
		break
	case "see_skills":
		var len = array_length(struct_options2.skills)
		choice_objets = select_skills_menu(choice_objets, len, n)
		break
	case "use_skills":
		var len = array_length(struct_options1)
		choice_objets = select_skills_menu(choice_objets, len, n)
		if keyboard_check_pressed(vk_space) {
			choice_options3 = choice_objets + n*choice_objets_page
			audio_play_sound(snd_select, 4, false)
			submenu_i ++
		}
		break
	case "use_skills_char":
		choice_options4 = select_choice(choice_options4, array_length(global.team_v)-1, true)
		if keyboard_check_pressed(vk_space) {
			if !menu_use_ability(struct_options1[choice_options3], global.team_v[choice_options4]) {
				audio_play_sound(snd_heal, 4, false)
				global.team_v[choice_options1].PM -= struct_options1[choice_options3].PM
				if global.team_v[choice_options1].PM < struct_options1[choice_options3].PM {
					submenu --
				}
			}
		}
	}
}