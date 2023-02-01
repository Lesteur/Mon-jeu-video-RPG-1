function dispo_team() {
	for (var i = 0; i<array_length(global.team); i++) {
		var char = global.team[i]
		if !instance_exists(char) {
			var char = instance_create_layer(0, 0, "Instances_1", char)
		}
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

function set_equipment(player, weap=true) {
	var array = ds_map_keys_to_array(player.equipment)
	player.attack = player.real_attack
	player.magic_attack = player.real_magic_attack
	player.defense = player.real_defense
	player.magic_defense = player.real_magic_defense
	player.agility = player.real_agility
	player.accuracy = player.real_accuracy
	for (var i = 0; i < array_length(array); i++) {
		if is_struct(player.equipment[? array[i]]) {
			player.attack += player.equipment[? array[i]].attack
			player.magic_attack += player.equipment[? array[i]].magic_attack
			player.defense += player.equipment[? array[i]].defense
			player.magic_defense += player.equipment[? array[i]].magic_defense
			player.accuracy += player.equipment[? array[i]].accuracy
			player.agility += player.equipment[? array[i]].agility
		} else if is_array(player.equipment[? array[i]]) {
			player.attack += player.equipment[? array[i]][0].attack
		}
	}
	if player.attack < 1 {
		player.attack = 1
	}
	if player.magic_attack < 1 {
		player.magic_attack = 1
	}
	if player.defense < 1 {
		player.defense = 1
	}
	if player.magic_defense < 1 {
		player.magic_defense = 1
	}
	if player.accuracy < 1 {
		player.accuracy = 1
	}
	if player.agility < 1 {
		player.agility = 1
	}
	if weap {
		player.effect = player.weapon.effect
		player.element = player.weapon.element
		player.sound = player.weapon.sound
	}
}

function set_equipment2() {
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
	var attack = 1
	var array = ds_map_keys_to_array(cible[a].status_list)
	for (var i = 0; i < array_length(array); i++) {
		var alt = array[i]
		switch (alt) {
			case "burn":
			case "freeze":
				if comp.element == "fire" || comp.element == "ice" {
					attack += 0.5
				}
				break
			case "paralysis":
				if comp.element == "thunder" || comp.element == "water" {
					attack += 0.5
				}
				break
		}
	}
	return attack
}
	
function add_action(action) {
	array_insert(historique_actions, array_length(historique_actions), action)
}
	
function valuable_action(action, type, type_cible) {
	if action[0] != type {
		return false
	}
	if type_cible == "enemy" {
			return array_length(research_array_3d(global.team_enemy, action[2])) > 0
	} else if type_cible == "ally" {
		return array_length(research_array_3d(global.team, action[2])) > 0
	}
	return false
}

function valuable_action2(act1, typ1, typ_c1, act2, typ2, typ_c2, ordre) {
	if ordre == 0 {
		var c = research_array(act1[2], act2[1]) != noone//(act1[1] == act2[1])
	} else {
		var c = array_length(research_array_3d(act1[2], act2[2])) > 0
	}
	return valuable_action(act1, typ1, typ_c1) && valuable_action(act2, typ2, typ_c2) && c
}

//actions : bonus_alt, malus_alt, bonus_stat, malus_stat, weakness, attack
function check_strategy() {
	var last_action = historique_actions[array_length(historique_actions)-1]
	if valuable_action(last_action, "weakness", "enemy") {
		strategy_points ++
	} else if valuable_action(last_action, "heal", "ally") {
		strategy_points ++
	} else if valuable_action(last_action, "extreme_heal", "ally") {
		strategy_points += 2
	} else if valuable_action(last_action, "malus_alt", "enemy") {
		strategy_points ++
	} else if valuable_action(last_action, "bonus_alt", "ally") {
		strategy_points ++
	} else if valuable_action(last_action, "malus_stat", "enemy") {
		strategy_points ++
	} else if valuable_action(last_action, "bonus_stat", "ally") {
		strategy_points ++
	}
	if array_length(historique_actions) >= 2 {
		var last_two_action = historique_actions[array_length(historique_actions)-2]
		if valuable_action2(last_two_action, "malus_stat", "enemy", last_action, "attack", "enemy", 1) {
			strategy_points += 1
		} else if valuable_action2(last_two_action, "malus_stat", "enemy", last_action, "weakness", "enemy", 1) {
			strategy_points += 2
		} else if valuable_action2(last_two_action, "malus_alt", "enemy", last_action, "attack", "enemy", 1) {
			strategy_points += 1
		} else if valuable_action2(last_two_action, "malus_alt", "enemy", last_action, "weakness", "enemy", 1) {
			strategy_points += 2
		} else if valuable_action2(last_two_action, "bonus_stat", "ally", last_action, "attack", "enemy", 0) {
			strategy_points += 1
		} else if valuable_action2(last_two_action, "bonus_stat", "ally", last_action, "weakness", "enemy", 0) {
			strategy_points += 2
		}

	}
}
	
function add_loot() {
	for (var i = 0; i < array_length(global.team_enemy); i++) {
		for (var a = 0; a < array_length(global.team_enemy[i].booty); a+= 2) {
			var object = global.team_enemy[i].booty[a]
			var ind = research_array(loot, object)
			if ind != noone {
				loot[ind+1] += global.team_enemy[i].booty[a+1]
			} else {
				array_insert(loot, array_length(loot), object)
				array_insert(loot, array_length(loot), global.team_enemy[i].booty[a+1])
			}
		}
	}
}

function add_inventory(add_boot) {
	for (var i = 0; i < array_length(add_boot); i+= 2) {
			var object = add_boot[i]
			var ind = research_array(global.inventory, object)
			if ind != noone {
				global.inventory[ind+1] += add_boot[i+1]
			} else {
				array_insert(global.inventory, 0, object)
				array_insert(global.inventory, 1, add_boot[i+1])
			}
	}
}
	
function remove_inventory(indice, storage, n = 1) {
	var stor = variable_global_get(storage)
	stor[indice+1] -= n
	if stor[indice+1] <= 0 {
		array_delete(stor, indice, 2)
	}
}
	
function fight_result(strategy, turn, damage, level) {
	var sc = strategy
	if turn <= 5*power(1.2, level) {
		sc += 150 * (5*power(1.2, level)-turn)
	}
	if sc >= level*1000 && turn <= 5*power(1.2, level) && damage <= 20*level {
		return "s"
	} else if sc >= level*800 && turn <= 6*power(1.2, level) && damage <= 25*level {
		return "a"
	} else if sc >= level*600 && turn <= 7*power(1.2, level) && damage <= 30*level {
		return "b"
	} else if sc >= level*400 && turn <= 9*power(1.2, level) {
		return "c"
	} else if sc >= level*200 {
		return "d"
	} else {
		return "e"
	}
}
	
function EXP_mult(grade) {
	if grade == "s" {
		return 2
	} else if grade == "a" {
		return 1.8
	} else if grade == "b" {
		return 1.6
	} else if grade == "c" {
		return 1.4
	} else if grade == "d" {
		return 1.2
	}
	return 1
}
	
function description_skill(player, sk) {
	if sk.type_attack == "weapon" {
		var t = player.weapon.type_attack
	} else {
		var t = sk.type_attack
	}
	t = string(global.icon[? t])
	if sk.element == "weapon" {
		var e = player.weapon.element
	} else {
		var e = sk.element
	}
	e = string(global.icon[? e])
	if sk.funct == Increase {
		var word = " Effets :"
		for (var i = 0; i < array_length(sk.puissance); i+= 3) {
			var effect = string(global.icon[? sk.puissance[i]])
			word += " <e"+effect+"> " + string(sk.puissance[i+1])
		}
	} else {
		var word = " Puissance : "+string(sk.puissance)
	}
	return "#Type : <e"+t+"> Élément : <e"+e+">" + word
}

function param_fight(variable) {
	if variable_struct_exists(global.param_fight, variable) {
		return variable_struct_get(global.param_fight, variable)
	} else {
		return -1
	}
}
	
function message_intro_fight() {
	var t = []
	for (var i = 0; i < array_length(global.team_enemy); i++) {
		var n = global.team_enemy[i].num
		var indice = check_num(t, n)
		if indice == noone {
			array_push(t, global.team_enemy[i], 1)
		} else {
			global.team_enemy[i-1].letter = " " + global.alphabet[t[1 + indice]-1]
			global.team_enemy[i].letter = " " + global.alphabet[t[1 + indice]]
			t[1 + indice] += 1
		}
	}
	var long = array_length(t)
	var mess = ""
	for (var i = 0; i < long; i+= 2) {
		mess += call_object(t[i], "un", t[i+1], true)
		if t[i+1] > 1 {
			mess += " apparaissent !#"
		} else {
			mess += " apparaît !#"
		}
	}
	return string(mess)
}

function recup_data_fight() {
	for (var i = 0; i < array_length(global.team); i++) {
		var char = global.team[i]
		var j = char.Num
		if char.PV > 0 {
			global.characters[j].PV = char.PV
		} else {
			global.characters[j].PV = 1
		}
		global.characters[j].PV_Max = char.PV_Max
		global.characters[j].PM = char.PM
		global.characters[j].PM_Max = char.PM_Max
		global.characters[j].Niveau = char.Niveau
		global.characters[j].EXP = char.EXP
		global.characters[j].EXP_restant = char.EXP_restant
		
		global.characters[j].real_attack = char.real_attack
		global.characters[j].real_defense = char.real_defense
		global.characters[j].real_magic_attack = char.real_magic_attack
		global.characters[j].real_magic_defense = char.real_magic_defense
		global.characters[j].real_accuracy = char.real_accuracy
		global.characters[j].real_agility = char.real_agility
	}
}