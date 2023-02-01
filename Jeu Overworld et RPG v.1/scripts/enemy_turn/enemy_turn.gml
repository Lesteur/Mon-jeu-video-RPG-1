function enemy_turn(enemy){
	
	var sta = ["paralysis", "freeze", "turnstone"]
	var immo = research_array_3d(ds_map_keys_to_array(enemy.status_list), sta)

	if enemy.status == "KO" {
		alarm[0] = 1
	} else if array_length(immo) != 0 && !act {
		act = true
		lanceur = enemy
		message_monitor = call_object(enemy, "le", 1, true, true) + " ne peut plus bouger !"
		alarm[0] = 40
		alarm[3] = 39
	} else {
		choice_enemy = enemy.skills[script_execute(enemy.choice_enemy_skill, enemy)]
		
		if choice_enemy.portee == 0 {
			enemy_target = enemy
		} else {
			enemy_target = team_a[script_execute(enemy.choice_enemy_target)]
		}
		
		if !act {
			script_execute(choice_enemy.funct, enemy, enemy_target, choice_enemy)
			message_monitor = string_replace(choice_enemy.description_2, "<enemy>", call_object(enemy, "le", 1, true, true))
		}
	}

}