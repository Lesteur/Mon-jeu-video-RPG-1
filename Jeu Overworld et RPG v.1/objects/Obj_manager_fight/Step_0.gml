// Choix du tour

if !issue_battle {
  if (global.player_turn == 0) && turn < array_length(global.team) {
  	player_turn(global.team[turn])
  } else if (global.player_turn == 1) {
	enemy_turn(global.team_enemy[turn])
  }
}

if issue_battle == 1 {
	message_monitor = "Victoire !"
	
	if keyboard_check_pressed(vk_space) {
		if !act {
			act = true
		} else {
			defil = 1000
		}
		if EXP_won == 0 && defil && !quit {
			quit = true
			Obj_manager.fade = 0.01
			Obj_manager.fadeDirection = 1
			alarm[10] = 25
		}
	}
	if act {
		defil ++
		if EXP_won > 0 && defil >= 160 {
			def_exp(self)
		}
	}
} else if issue_battle == 2 {
	message_monitor = "L'équipe a perdu... Game Over !"
}