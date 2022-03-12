function use_skills(player, skill){

	if player.PM >= skill[1] {	
		if skill[4] == 1 && menu[menu_i] == "skills" {
			menu_i ++
			menu[menu_i] = "skills_target"
			if skill[7] == "heal" {
				team_target = team_a
			} else {
				team_target = team_enemy_a
			}
			audio_play_sound(snd_select, 4, false)
		} else if skill[4] == 2 && menu[menu_i] == "skills" {
			menu_i ++
			menu[menu_i] = "skills_target"
			if skill[7] == "heal" {
				team_target = team_a
			} else {
				team_target = team_enemy_a
			}
			all_target = false
			audio_play_sound(snd_select, 4, false)
		} else {
			player.PM -= skill[1]
			message_monitor = player.Name + " lance " + string(skill[0]) + " !"
			script_execute(skill[2], player, team_target[target], skill)
		}
	} else {
		message_quick = "Pas assez de PM !"
		message_quick_t = 50
	}
		
}
