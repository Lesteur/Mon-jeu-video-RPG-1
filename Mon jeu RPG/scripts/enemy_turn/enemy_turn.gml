function enemy_turn(enemy){

	if enemy.status == "KO" {
		alarm[0] = 1
	} else {

		choice_enemy = enemy.skills[irandom(2)]
		
		if choice_enemy[5] == 0 {
			enemy_target = enemy
		} else {
			enemy_target = team_a[irandom(array_length(team_a)-1)]
		}
	
		if !act {
			script_execute(choice_enemy[2], enemy, enemy_target, choice_enemy)
			message_monitor = choice_enemy[6]
		}
	}

}