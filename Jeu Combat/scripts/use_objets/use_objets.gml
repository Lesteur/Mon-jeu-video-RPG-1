function use_objets(player, objet){
	
	if menu[menu_i] == "objets" {
		menu_i ++
		menu[menu_i] = "objets_target"
		audio_play_sound(snd_select, 4, false)
	} else {
		message_monitor = player.Nom + " utilise " + string(objet[0]) + " !"
		lanceur = player
		player.animation = 5
		global.inventory[choice_objets][1] --
		if global.inventory[choice_objets][1] == 0 {
			ds_list_delete(global.inventory, choice_objets)
		}
		script_execute(objet[2], player, team_target[target], objet)
	}
	
}