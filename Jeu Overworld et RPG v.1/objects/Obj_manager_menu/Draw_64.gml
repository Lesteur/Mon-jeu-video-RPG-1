switch(menu[menu_i]) {
	case "home":
		draw_menu_main()
		break
	case "inventory":
		draw_menu_inventory()
		break
	case "skills":
		draw_menu_skills()
		break
	case "formation_team":
		draw_formation(1)
		break
	case "save":
		draw_menu_save()
		break
}