function choose_autoheal(team) {
	var i = 0
	var pourcent = team[0].PV/team[0].PV_Max
	for (var a = 1; a < array_length(team); a++) {
		if team[a].PV/team[a].PV_Max < pourcent {
			pourcent = team[a].PV/team[a].PV_Max
			i = a
		}
	}
	return i
}

function objects_autoheal() {
	var liste = []
	for (var i = 0; i < array_length(global.inventory); i += 2) {
		if global.inventory[i].funct == PV_recup {
			array_push(liste, i)
		}
	}
	return liste
}
	
function menu_use_ability(ability, character) {
	var complete = false
	var f = ability.funct
	if f == Atk_magique && ability.element == "heal" {
		f = PV_recup
	}
	switch(f) {
		case PV_recup:
			if character.PV == character.PV_Max {
				complete = true
			}
			var puiss = ability.puissance
			if (puiss < character.PV_Max*puiss*0.01) {
				character.PV += round(character.PV_Max*puiss*0.01)
			} else {
				character.PV += puiss
			}
			if character.PV > character.PV_Max {
				character.PV = character.PV_Max
			}
			break
		case PM_recup:
			if character.PM == character.PM_Max {
				complete = true
			}
			var puiss = ability.puissance
			character.PM += puiss
			if character.PM > character.PM_Max {
				character.PM = character.PM_Max
			}
			break
	}
	return complete
}

function use_objects_autoheal(team, objects, player) {
	var pourcent = (team[player].PV/team[player].PV_Max)*100
	if array_length(objects) > 0 {
		var obj_indice = objects[0]
		for (var i = 1; i < array_length(objects); i++) {
			var obj_current = objects[i]
			if (global.inventory[obj_current].puissance + pourcent) <= 100 && global.inventory[obj_current].puissance > global.inventory[obj_indice].puissance {
				obj_indice = obj_current
			}
		}
		var puiss = global.inventory[obj_indice].puissance
		var mess = global.inventory[obj_indice].name
		remove_inventory(obj_indice, "inventory")
		//menu_use_ability(global.inventory[obj_indice], team[player])
		if (puiss < team[player].PV_Max*puiss*0.01) {
			team[player].PV += round(team[player].PV_Max*puiss*0.01)
		} else {
			team[player].PV += puiss
		}
		if team[player].PV > team[player].PV_Max {
			team[player].PV = team[player].PV_Max
		}
	}
	return mess
}

function skills_autoheal() {
	var liste = []
	for (var i = 0; i < array_length(global.characters); i ++) {
		var char = global.characters[i]
		var sk = char.skills
		var t = [char]
		for (var j = 0; j < array_length(sk); j ++) {
			if sk[j].element == "heal" && char.PM >= sk[j].PM {
				array_push(t, sk[j])
			}
		}
		if array_length(t) > 1 {
			array_push(liste, t)
		}
	}
	return liste
}

function use_skills_autoheal(team, skills, player) {
	var pourcent = (team[player].PV/team[player].PV_Max)*100
	if array_length(skills) > 0 {
		var char = skills[0]
		var skill = skills[1]
		for (var i = 2; i < array_length(skills); i++) {
			if (skills[i].puissance + pourcent) <= 100 && skills[i].puissance > skill.puissance {
				skill = skills[i]
			}
		}
		var puiss = skill.puissance
		char.PM -= skill.PM
		//menu_use_ability(skill, team[player])
		if (puiss < team[player].PV_Max*puiss*0.01) {
			team[player].PV += round(team[player].PV_Max*puiss*0.01)
		} else {
			team[player].PV += puiss
		}
		if team[player].PV > team[player].PV_Max {
			team[player].PV = team[player].PV_Max
		}
		mess = skill.name
	}
	return mess
}

function all_pv_autoheal(team) {
	var pv = 0
	var pv_max = 0
	for (var i = 0; i < array_length(team); i++) {
		pv += team[i].PV
		pv_max += team[i].PV_Max
	}
	return pv == pv_max
}

function autoheal(team) {
	var objects = objects_autoheal()
	var skills = skills_autoheal()
	var pv_team = all_pv_autoheal(team)
	var mess = ""
	while !pv_team && (array_length(objects) || array_length(skills)) {
		audio_play_sound(snd_heal, 5, false)
		var player = choose_autoheal(team)
		if array_length(skills) {
			mess += use_skills_autoheal(team, skills[0], player)
		} else {
			mess += use_objects_autoheal(team, objects, player)
		}
		var objects = objects_autoheal()
		var skills = skills_autoheal()
		var pv_team = all_pv_autoheal(team)
		mess += " "
	}
	return mess
}

function tri_objets(inventory, variable="num") {
	var array = variable_global_get(inventory)
	var n = array_length(array)
	for (var i = 0; i < n-2; i+= 2) {
		var  mini = i
		for (var j = i+2; j < n; j+= 2) {
			if variable_struct_get(array[j], variable) < variable_struct_get(array[mini], variable) {
				mini = j
			}
		}
		var elem1 = [array[i], array[i+1]]
		var elem2 = [array[mini], array[mini+1]]
		array[mini] = elem1[0]
		array[mini+1] = elem1[1]
		array[i] = elem2[0]
		array[i+1] = elem2[1]
	}
	return array
}
	
function select_objects_menu(variable, len, n) {
	
	var l = (n-1)*2
	var pages = ceil(len/(n*2)) - 1
	if choice_objets_page == pages && len mod (n*2) != 0 {
		l = (len mod (n*2)) - 2
	}
	var number = l
	
	var dir_1 = vk_left
	var dir_2 = vk_right
	var dir_3 = vk_up
	var dir_4 = vk_down
	
	if keyboard_check_pressed(dir_1) {
		variable -= n
		if variable < 0 {
			if choice_objets_page != 0 {
				choice_objets_page --
				variable += 2*n//-(variable)
			} else {
				variable = 0
			}
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_2) {
		variable += n
		if variable > number {
			if choice_objets_page < pages {
				choice_objets_page ++
				variable -= 2*n
				if choice_objets_page == pages && len mod (n*2) != 0 {
					var l = (len mod (n*2)) - 2
					if variable > l {
						variable = l
					}
				}
			} else {
				variable = number
			}
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	if keyboard_check_pressed(dir_3) && number > 0 {
		variable -= 2
		if variable == n-2 {
			variable = number
		} else if variable < 0 {
			variable = n-2
		}
		
		if variable > number {
			variable = number
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_4) && number > 0 {
		variable += 2
		if variable == n {
			variable = 0
		} else if variable > number {
			variable = n
		}
		
		if variable > number {
			variable = 0
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	return variable
	
}

function select_skills_menu(variable, len, n) {
	
	var l = n-1
	var pages = ceil(len/n) - 1
	if choice_objets_page == pages && len mod n != 0 {
		l = (len mod n) - 1
	}
	var number = l
	
	var dir_1 = vk_left
	var dir_2 = vk_right
	var dir_3 = vk_up
	var dir_4 = vk_down
	
	if keyboard_check_pressed(dir_1) {
		variable -= n/2
		if variable < 0 {
			if choice_objets_page != 0 {
				choice_objets_page --
				variable += n//-(variable)
			} else {
				variable = 0
			}
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_2) {
		variable += n/2
		if variable > number {
			if choice_objets_page < pages {
				choice_objets_page ++
				variable -= n
				if choice_objets_page == pages && len mod n != 0 {
					var l = (len mod n) - 1
					if variable > l {
						variable = l
					}
				}
			} else {
				variable = number
			}
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	if keyboard_check_pressed(dir_3) && number > 0 {
		variable --
		if variable == n/2 - 1 {
			variable = number
		} else if variable < 0 {
			variable = n/2 - 1
		}
		
		if variable > number {
			variable = number
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_4) && number > 0 {
		variable ++
		if variable == n/2 {
			variable = 0
		} else if variable > number {
			variable = n/2
		}
		
		if variable > number {
			variable = 0
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	return variable
	
}