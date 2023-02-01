function script_menu_main(){
	switch(menu[menu_i]) {
	case "home":
		choice_menu_main = select_choice(choice_menu_main, 5, 0)
		break
	}
	
	if keyboard_check_pressed(vk_space) {
		choice_options1 = 0
		choice_options2 = 0
		choice_options3 = 0
		choice_options4 = 0
		choice_options5 = 0
		switch(choice_menu_main) {
		case 0:
			menu_i ++
			choice_objets = 0
			choice_objets_page = 0
			menu[menu_i] = "inventory"
			submenu = ["object_options"]
			submenu_i = 0
			break
		case 1:
			menu_i ++
			menu[menu_i] = "formation_team"
			break
		case 2:
			menu_i ++
			menu[menu_i] = "equipment"
			submenu = ["select_characters"]
			submenu_i = 0
			break
		case 3:
			menu_i ++
			menu[menu_i] = "skills"
			submenu = ["select_characters"]
			submenu_i = 0
			break
		case 4:
			menu_i ++
			menu[menu_i] = "save"
			submenu = ["save"]
			submenu_i = 0
			struct_options1 = load_menu_data()
			break
		}
	}
	
	if keyboard_check_pressed(ord("A")) {
		mess = autoheal(global.characters)
	}
}