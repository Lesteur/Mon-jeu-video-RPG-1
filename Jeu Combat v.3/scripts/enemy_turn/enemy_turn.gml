function enemy_turn(enemy){

	if enemy.status == "KO" {
		alarm[0] = 1
	} else {
		
		choice_enemy = enemy.skills[script_execute(enemy.choice_enemy_skill, enemy)]
		
		if choice_enemy.portee == 0 {
			enemy_target = enemy
		} else {
			enemy_target = team_a[script_execute(enemy.choice_enemy_target)]
		}
	
		if !act {
			script_execute(choice_enemy.funct, enemy, enemy_target, choice_enemy)
			message_monitor = choice_enemy.description_1
		}
	}

}