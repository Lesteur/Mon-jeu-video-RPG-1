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
