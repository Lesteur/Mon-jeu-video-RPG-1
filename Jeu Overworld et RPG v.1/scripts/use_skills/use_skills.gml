function use_skills(player, skill){

	if player.PM >= skill.PM {
		var mess = skill.description_2
		mess = string_replace(mess, "<player>", player.name)
		mess = string_replace(mess, "<skill>", skill.name)
		if menu[menu_i] == "skills" {
		//if skill.portee == 0 && menu[menu_i] == "skills" {
			if skill.portee == 0 {
				player.PM -= skill.PM
				message_monitor = mess
				script_execute(skill.funct, player, player, skill)
			} else if skill.portee == 1 || skill.portee == 2 {
				menu_i ++
				menu[menu_i] = "skills_target"
				team_target = team_enemy_a
				if skill.portee == 2 {
					all_target = false
				}
				audio_play_sound(snd_select, 4, false)
			} else if skill.portee == 3 || skill.portee == 4 {
				menu_i ++
				menu[menu_i] = "skills_target"
				team_target = team_a
				if skill.portee == 4 {
					all_target = false
				}
				audio_play_sound(snd_select, 4, false)
			}
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