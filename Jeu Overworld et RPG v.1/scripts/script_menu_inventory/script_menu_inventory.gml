function script_menu_inventory() {
	
	var storage = variable_global_get("inventory")
	switch(submenu[submenu_i]) {
	case "object_options":
		choice_options1 = select_choice(choice_options1, 4, false)
		if keyboard_check_pressed(vk_space) {
			choice_objets = 0
			choice_objets_page = 0
			switch(choice_options1) {
			case 0:
				audio_play_sound(snd_select, 4, false)
				submenu_i ++
				submenu[submenu_i] = "choice_inventory"
				submenu[submenu_i+1] = "use_objects"
				break
			case 4:
				audio_play_sound(snd_select, 4, false)
				tri_objets("inventory")
				break
			}
		}
		break
	case "choice_inventory":
		var len = array_length(storage)
		choice_objets = select_objects_menu(choice_objets, len, n)
		if keyboard_check_pressed(vk_space) {
			choice_options2 = choice_objets + n*choice_objets_page*2
			if storage[choice_options2].utilisation == 0 {
				audio_play_sound(snd_false, 5, false)
			} else {
				audio_play_sound(snd_select, 4, false)
				submenu_i ++
			}
		}
		break
	case "use_objects":
		choice_options3 = select_choice(choice_options3, array_length(global.team_v)-1, true)
		if keyboard_check_pressed(vk_space) {
			if !menu_use_ability(storage[choice_options2], global.team_v[choice_options3]) {
				audio_play_sound(snd_heal, 4, false)
				if storage[choice_options2 + 1] == 1 {
					submenu_i --
				}
				remove_inventory(choice_options2, "inventory")
				
				var len = array_length(storage)
				var l = (n-1)*2
				var pages = ceil(len/(n*2)) - 1
				if choice_objets_page == pages && len mod (n*2) != 0 {
					l = (len mod (n*2)) - 2
				}
				
				if choice_objets_page > pages {
					choice_objets_page --
					choice_objets = l
				} else if choice_options2 > l {
					choice_objets = l
				}
			}
		}
		break
	}
}