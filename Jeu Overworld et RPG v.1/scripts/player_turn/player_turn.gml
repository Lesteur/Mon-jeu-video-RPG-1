function player_turn(player) {
	
	var sta = ["paralysis", "freeze", "turnstone"]
	var immo = research_array_3d(ds_map_keys_to_array(player.status_list), sta)
	
	if player.status == "KO" && !act {
		alarm[0] = 1
	} else if array_length(immo) != 0 && !act {
		act = true
		lanceur = player
		message_monitor = player.name + " ne peut plus bouger !"
		alarm[3] = 40
	} else {
		var name = player.name
		
		if !act {
		switch(menu[menu_i]) {
			case "action":
				choice = select_choice(choice, 5, true)
				message_monitor = message_routine[message_i]
				break
			case "skills":
				var len = array_length(player.skills)
				var l = n-1
				var pages = ceil(len/n) - 1
				if choice_skill_page == pages && len mod n != 0 {
					l = (len mod n) - 1
					if choice_skill > l {
						choice_skill = l
					}
				}
				var m = choice_skill + n*choice_skill_page
				choice_skill = select_choice(choice_skill, l, false)
				choice_skill_page = select_choice(choice_skill_page, pages, true)
				var sk = player.skills[m]
				message_monitor = sk.description_1 + description_skill(player, sk)
				break
			case "objects":
				var len = array_length(global.inventory)
				var l = (n-1)*2
				var pages = ceil(len/(n*2)) - 1
				if choice_objets_page == pages && len mod (n*2) != 0 {
					l = (len mod (n*2)) - 2
					if choice_objets > l {
						choice_objets = l-1
					}
				}
				var t = choice_objets + n*choice_objets_page*2
				choice_objets = select_choice(choice_objets, l, false, 2)
				choice_objets_page = select_choice(choice_objets_page, pages, true)
				message_monitor = global.inventory[t].description_1
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
						script_execute(player.Basic_attack.funct, player, team_target[target], player.Basic_attack)
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
						use_skills(player, player.skills[choice_skill+n*choice_skill_page])
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
						target = 0
						menu_i ++
						menu[menu_i] = "objects"
						audio_play_sound(snd_select, 4, false)
					} else if (menu[menu_i] == "objects") || (menu[menu_i] == "objects_target") {
						var t = choice_objets + n*choice_objets_page*2
						use_objects(player, global.inventory[t])
					}
					break
				case 4:
					act = true
					player.guard = 1.5
					player.image_index = 0
					lanceur = player
					cible = []
					add_action(["guard", lanceur, cible])
					alarm[3] = 40
					message_monitor = name + " se met en garde !"
					audio_play_sound(snd_select, 4, false)
					break
				case 5:
					if param_fight("flee") == -1 {
						issue_battle = 3
						audio_play_sound(snd_select, 4, false)
					} else {
						message_quick = "Hein ?! C'est pas le moment pour ça !"
						message_quick_t = 50
						audio_play_sound(snd_false, 4, false)
					}
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
			message_monitor = call_object(team_enemy_a[choice_exam])
		}
	
		if (menu[menu_i] == "target" || menu[menu_i] == "skills_target" || menu[menu_i] == "objects_target") && !act {
			select_charac(team_target)
			cursor_i += 1/3
			if all_target != true {
				message_monitor = call_object(team_target[target],,,,true)
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
				team_form = global.team
			}
			menu_i --
			message_quick_t = 0
			all_target = noone
			ally_form = noone
			choice_form = 0
			audio_play_sound(snd_false, 5, false)
		}

		if (menu_effect < 19) {
			if menu_effect >= 9 {
				menu_effect += (19/4)
			} else {
				menu_effect += 9.5
			}
		}

	}

	if ((menu_effect > 0) && act) {
			if menu_effect <= 9 {
				menu_effect -= (19/4)
			} else {
				menu_effect -= 9.5
			}
	}

	}

}