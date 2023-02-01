function script_menu_equipment() {
	
	switch(submenu[submenu_i]) {
	case "select_characters":
		choice_options1 = select_choice(choice_options1, array_length(global.team_v)-1, true)
		if keyboard_check_pressed(vk_space) {
			submenu_i ++
			submenu[submenu_i] = "equipment"
			choice_objets = 0
			struct_options1 = global.team_v[choice_options1].equipment
		}
		break
	case "equipment":
		choice_options2 = select_choice(choice_options2, 5, false)
	}
}