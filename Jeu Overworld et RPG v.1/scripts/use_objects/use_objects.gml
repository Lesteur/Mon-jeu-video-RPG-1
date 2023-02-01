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
		var mess = "<player> utilise <object> !"
		mess = string_replace(mess, "<player>", player.name)
		mess = string_replace(mess, "<object>", call_object(object, "un"))
		message_monitor = mess
		lanceur = player
		player.animation = 5
		player.image_index = 0
		var t = choice_objets + n*choice_objets_page*2
		remove_inventory(t, "inventory")
		//global.inventory[t+1] --
		//if global.inventory[t+1] == 0 {
		//	array_delete(global.inventory, t, 2)
		//}
		var array = team_target[target].weakness
		var w = noone
		if w != noone {
			script_execute(array[w][2], player, team_target[target], array[w][3])
		} else {
			script_execute(object.funct, player, team_target[target], object)
		}
	}
	
}