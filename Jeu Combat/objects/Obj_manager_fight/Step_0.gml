// Choix du tour

if !issue_battle {
  if (global.player_turn == 0) && turn < array_length(global.team) {
  	player_turn(global.team[turn])
  } else if (global.player_turn == 1) {
	enemy_turn(global.team_enemy[turn])
  }
}

if issue_battle == 1 {
	message_monitor = "Victoire ! Vous remportez 10 points d'EXP et 5 Galas !"
} else if issue_battle == 2 {
	message_monitor = "L'équipe a perdu... Game Over !"
}