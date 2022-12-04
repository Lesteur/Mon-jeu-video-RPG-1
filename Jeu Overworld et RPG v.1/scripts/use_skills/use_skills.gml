function use_skills(player, skill){

	if player.PM >= skill.PM {
		var mess = skill.description_2
		mess = string_replace(mess, "<player>", player.name)
		mess = string_replace(mess, "<skill>", skill.name)
		if skill.portee == 0 && menu[menu_i] == "skills" {
			player.PM -= skill.PM
			message_monitor = mess
			script_execute(skill.funct, player, player, skill)
		} else if skill.portee == 1 && menu[menu_i] == "skills" {
			menu_i ++
			menu[menu_i] = "skills_target"
			if skill.element == "heal" {
				team_target = team_a
			} else {
				team_target = team_enemy_a
			}
			audio_play_sound(snd_select, 4, false)
		} else if skill.portee == 2 && menu[menu_i] == "skills" {
			menu_i ++
			menu[menu_i] = "skills_target"
			team_target = team_enemy_a
			if skill.element == "heal" {
				team_target = team_a
			}
			all_target = false
			audio_play_sound(snd_select, 4, false)
		} else {
			player.PM -= skill.PM
			message_monitor = mess
			script_execute(skill.funct, player, team_target[target], skill)
		}
	} else {
		message_quick = "Pas assez de PM !"
		message_quick_t = 50
	}
		
}