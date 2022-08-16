function use_objects(player, object){
	
	if menu[menu_i] == "objects" {
		menu_i ++
		menu[menu_i] = "objects_target"
		audio_play_sound(snd_select, 4, false)
	} else {
		message_monitor = player.name + " utilise " + string(object.name) + " !"
		lanceur = player
		player.animation = 5
		global.inventory[choice_objets+1] --
		if global.inventory[choice_objets+1] == 0 {
			array_delete(global.inventory, choice_objets, 2)
		}
		
		var array = team_target[target].weakness
		var w = check_weakness(array, "object", object.name)
		
		if w != noone {
			script_execute(array[w][2], team_target[target], array[w][3])
		} else {
			script_execute(object.funct, player, team_target[target], object)
		}
	}
	
}