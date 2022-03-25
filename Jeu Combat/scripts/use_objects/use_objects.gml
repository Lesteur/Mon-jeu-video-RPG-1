function use_objects(player, object){
	
	if menu[menu_i] == "objects" {
		menu_i ++
		menu[menu_i] = "objects_target"
		audio_play_sound(snd_select, 4, false)
	} else {
		message_monitor = player.Name + " utilise " + string(object[0]) + " !"
		lanceur = player
		player.animation = 5
		global.inventory[choice_objets][1] --
		if global.inventory[choice_objets][1] == 0 {
			array_delete(global.inventory, choice_objets, 1)
		}
		script_execute(object[2], player, team_target[target], object)
	}
	
}
