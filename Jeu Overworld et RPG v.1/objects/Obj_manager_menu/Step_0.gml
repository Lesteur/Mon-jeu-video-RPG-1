if quit == 0 {
	if keyboard_check_pressed(ord("X")) {
		if menu_i == 0 {
			quit = 1
			alarm[0] = 25
			TransitionEffect("in")
		} else {
			if menu[menu_i] == "formation_team" {
				team_form = global.team_v
				ally_form = noone
				choice_form = 0
			}
			menu_i --
		}
	}
}

switch(menu[menu_i]) {
	case "home":
		script_menu_main()
		break
	case "formation_team":
		script_menu_formation()
		break
}