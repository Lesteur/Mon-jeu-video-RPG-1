if quit == 0 {
	if keyboard_check_pressed(ord("X")) {
		if submenu_i != 0 {
			submenu_i --
		} else if menu_i == 0 {
			quit = 1
			alarm[0] = 25
			TransitionEffect("in")
		} else {
			if menu[menu_i] == "formation_team" {
				var array = []
				array_copy(array, 0, global.team_v, 0, array_length(global.team_v))
				team_form = array
				ally_form = noone
				choice_form = 0
			}
			menu_i --
		}
		audio_play_sound(snd_false, 5, false)
	}
}

switch(menu[menu_i]) {
	case "home":
		script_menu_main()
		break
	case "inventory":
		script_menu_inventory()
		break
	case "formation_team":
		script_menu_formation()
		break
	case "skills":
		script_menu_skills()
		break
	case "save":
		script_menu_save()
		break
}