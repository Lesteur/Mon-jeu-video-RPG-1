function script_menu_save(){
	switch(submenu[submenu_i]) {
	case "save":
		choice_options1 = select_choice(choice_options1, 4, false)
	}
	
	if keyboard_check_pressed(vk_space) {
		save_all_data(choice_options1)
		struct_options1 = load_menu_data()
	}
}