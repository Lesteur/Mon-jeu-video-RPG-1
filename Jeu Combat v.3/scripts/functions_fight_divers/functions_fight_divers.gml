function dispo_team() {
	for (var i = 0; i<array_length(global.team); i++) {
		var char = global.team[i]
		char.x = 90 - i*20
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
			if team[i].boost[? stat][1] <= 0 {
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
