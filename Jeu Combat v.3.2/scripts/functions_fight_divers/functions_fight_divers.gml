function dispo_team() {
	for (var i = 0; i<array_length(global.team); i++) {
		var char = global.team[i]
		char.x = 100 - i*15
		char.y = 80 + i*20
		char.depth = 40 - i*10
	}
}

function lower_boosts(team, n) {
	for (var i = 0; i < array_length(team); i++) {
		var keys = ds_map_keys_to_array(team[i].boost)
		for (var a= 0; a < array_length(keys); a++) {
			var stat = keys[a]
			team[i].boost[? stat][1] -= n
			if team[i].boost[? stat][1] == 0 {
				team[i].boost[? stat][1] = 0
				team[i].boost[? stat][0] = 0
			}
		}
	}
}

function set_equipment() {
	var array = ds_map_keys_to_array(equipment)
	attack = real_attack
	magic_attack = real_magic_attack
	defense = real_defense
	magic_defense = real_magic_defense
	agility = real_agility
	accuracy = real_accuracy
	for (var i = 0; i < array_length(array); i++) {
		if !is_array(equipment[? array[i]]) {
			attack += equipment[? array[i]].attack
			magic_attack += equipment[? array[i]].magic_attack
			defense += equipment[? array[i]].defense
			magic_defense += equipment[? array[i]].magic_defense
			accuracy += equipment[? array[i]].accuracy
			agility += equipment[? array[i]].agility
		} else {
			attack += equipment[? array[i]][0].attack
		}
	}
	if attack < 1 {
		attack = 1
	}
	if magic_attack < 1 {
		magic_attack = 1
	}
	if defense < 1 {
		defense = 1
	}
	if magic_defense < 1 {
		magic_defense = 1
	}
	if accuracy < 1 {
		accuracy = 1
	}
	if agility < 1 {
		agility = 1
	}
	effect = weapon.effect
	element = weapon.element
	sound = weapon.sound
}

function check_weakness(array, type, element) {
	var w = noone
	for (var i = 0; i < array_length(array); i++) {
		if array[i][0] == type {
			if array[i][1] == element {
				w = i
			}
		}
	}
	return w
}

function lower_statuts() {
	var array_list = ds_map_keys_to_array(turn_team[turn].status_list)
	for (var i = 0; i < array_length(array_list); i++) {
		var alt = array_list[i]
		turn_team[turn].status_list[? alt] --
		if turn_team[turn].status_list[? alt] == 0 {
			ds_map_delete(turn_team[turn].status_list, alt)
		}
	}
}

function effect_status(comp, a) {
	var attack_status = 1
	var array = ds_map_keys_to_array(cible[a].status_list)
	for (var i = 0; i < array_length(array); i++) {
		var alt = array[i]
		switch (alt) {
			case "burn":
			case "freeze":
				if comp.element == "fire" || comp.element == "ice" {
					attack_status += 0.3
				}
				break
			case "paralysis":
				if comp.element == "thunder" || comp.element == "water" {
					attack_status += 0.3
				}
				break
		}
	}
	return attack_status
}
	
function add_action(action) {
	array_insert(historique_actions, array_length(historique_actions), action)
}