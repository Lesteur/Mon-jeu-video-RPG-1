function player_turn(player) {

if player.status == "KO" and !act {
		alarm[0] = 1
	} else {
		
		var name = player.name
		
		if !act {
	
		switch(menu[menu_i]) {
			case "action":
				choice = select_choice(choice, 5, true)
				message_monitor = message_routine[message_i]
				break
			case "skills":
				choice_skill = select_choice(choice_skill, array_length(player.skills)-1, false)
				message_monitor = player.skills[choice_skill][6]
				break
			case "objects":
				choice_objets = select_choice(choice_objets, array_length(global.inventory)-1, false)
				message_monitor = global.inventory[choice_objets][4]
				break
			case "formation":
			case "formation_c":
				formation()
				break
		}
		
		if keyboard_check_pressed(ord("B")) && (menu[menu_i] == "action") {
			menu_i ++
			menu[menu_i] = "exam"
		}
	
		if keyboard_check_pressed(vk_space) {
			message_quick_t = 0
			switch(choice) {
				case 0:
					if menu[menu_i] == "target" {
						script_execute(player.Basic_attack[2], player, team_target[target], player.Basic_attack)
						message_monitor = name + " attaque !"
					} else if menu[menu_i] == "action" {
						team_target = team_enemy_a
						menu_i ++
						menu[menu_i] = "target"
					}
					audio_play_sound(snd_select, 4, false)
					break
				case 1:
					if menu[menu_i] == "action" {
						menu_i ++
						menu[menu_i] = "skills"
						audio_play_sound(snd_select, 4, false)
					} else if (menu[menu_i] == "skills") || (menu[menu_i] == "skills_target") {
						use_skills(player, player.skills[choice_skill])
					}
					break
				case 2:
					if menu[menu_i] == "action" && turn_form <= 0 {
						menu_i ++
						menu[menu_i] = "formation"
						audio_play_sound(snd_select, 4, false)
					} else {
						message_quick = "Impossible de changer la formation !"
						message_quick_t = 50
						audio_play_sound(snd_false, 4, false)
					}
					break
				case 3:
					if array_length(global.inventory) == 0 {
						message_quick = "Plus aucun objet..."
						message_quick_t = 50
					} else if (menu[menu_i] == "action") {
						team_target = team_a
						target = 0
						menu_i ++
						menu[menu_i] = "objects"
						audio_play_sound(snd_select, 4, false)
					} else if (menu[menu_i] == "objects") || (menu[menu_i] == "objects_target") {
						use_objects(player, global.inventory[choice_objets])
					}
					break
				case 4:
					act = true
					player.guard = 1.5
					lanceur = player
					cible = player
					alarm[0] = 70
					message_monitor = name + " se met en garde !"
					audio_play_sound(snd_select, 4, false)
					break
				case 5:
					message_quick = "Hein ?! C'est pas le moment pour ça !"
					message_quick_t = 50
					audio_play_sound(snd_false, 4, false)
					break
			}
			if menu[menu_i] == "exam" {
				menu_i ++
				menu[menu_i] = "exam_enemy"
			}
	
		}
		
		if menu[menu_i] == "exam" && !act {
			choice_exam = select_choice(choice_exam, array_length(team_enemy_a)-1, false)
			cursor_i += 1/3
			message_monitor = team_enemy_a[choice_exam].name
		}
	
		if (menu[menu_i] == "target" || menu[menu_i] == "skills_target" || menu[menu_i] == "objects_target") && !act {
			select_charac(team_target)
			cursor_i += 1/3
			if all_target != true {
				message_monitor = team_target[target].name
			} else {
				message_monitor = "Tous sélectionnés"
			}
		}
		
		if  keyboard_check_pressed(vk_enter) && array_length(team_target) > 1 {
			if all_target == false {
				all_target = true
			} else if all_target = true {
				all_target = false
			}
		}
	
		if keyboard_check_pressed(ord("X")) && (menu_i > 0) {
			if menu[menu_i] == "formation" {
				global.team = team_form
			}
			menu_i --
			message_quick_t = 0
			all_target = noone
			ally_form = noone
			audio_play_sound(snd_false, 5, false)
		}
	
		if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) && (menu[menu_i] == "target" || menu[menu_i] == "skills_target" || menu[menu_i] == "objects_target") {
			if team_target == team_a {
				team_target = team_enemy_a
			} else {
				team_target = team_a
			}
		
			if target >= array_length(team_target) {
				target = 0
			}
			
			if array_length(team_target) == 1 && all_target = true {
				all_target = noone
			}
		}

		if (menu_effect < 38) {
			if menu_effect >= 19 {
				menu_effect += (38/4)
			} else {
				menu_effect += 19
			}
		}

	}

	if (menu_effect > 0) && act {
			if menu_effect <= 19 {
			menu_effect -= (38/4)
			} else {
			menu_effect -= 19
			}
	}

	}

}