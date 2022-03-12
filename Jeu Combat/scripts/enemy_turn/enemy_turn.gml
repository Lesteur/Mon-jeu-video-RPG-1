function enemy_turn(enemy){

	if enemy.statut == "KO" {
		alarm[0] = 1
	} else {

		choix_enemy = enemy.skills[irandom(2)]
		
		if choix_enemy[4] == 0 {
			enemy_target = enemy
		} else {
			enemy_target = team_a[irandom(array_length(team_a)-1)]
		}
	
		if !act {
			script_execute(choix_enemy[2], enemy, enemy_target, choix_enemy)
			message_monitor = choix_enemy[5]
		}
	}

}