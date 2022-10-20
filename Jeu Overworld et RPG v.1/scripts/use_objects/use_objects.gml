function use_objects(player, object){
	
	if menu[menu_i] == "objects" {
		menu_i ++
		menu[menu_i] = "objects_target"
		if object.portee == 1 {
			team_target = team_enemy_a
		} else {
			team_target = team_a
		}
		audio_play_sound(snd_select, 4, false)
	} else {
		message_monitor = player.name + " utilise " + call_object(object, 1) + " !"//string(object.name) + " !"
		lanceur = player
		player.animation = 5
		global.inventory[choice_objets+1] --
		if global.inventory[choice_objets+1] == 0 {
			array_delete(global.inventory, choice_objets, 2)
		}
		
		var array = team_target[target].weakness
		var w = noone//check_weakness(array, "object", object.true_name)
		
		if w != noone {
			script_execute(array[w][2], player, team_target[target], array[w][3])
		} else {
			script_execute(object.funct, player, team_target[target], object)
		}
	}
	
}