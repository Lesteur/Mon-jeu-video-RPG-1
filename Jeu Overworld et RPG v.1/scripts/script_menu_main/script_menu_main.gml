function script_menu_main(){
	switch(menu[menu_i]) {
	case "home":
		choice_menu_main = select_choice(choice_menu_main, 5, 0)
		break
	}
	
	if keyboard_check_pressed(vk_space) {
		switch(choice_menu_main) {
		case 1:
			menu_i ++
			menu[menu_i] = "formation_team"
			break
		}
	}
}