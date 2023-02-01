// Conditions actions

function PV_inferior(pourcent) {
	return (turn_team[turn].PV <= (turn_team[turn].PV_Max * pourcent))
}

function stats_inferior(stat, number) {
	return (turn_team[turn].boost[? stat][0] <= number)
}

function stats_superior(stat, number) {
	return (turn_team[turn].boost[? stat][0] >= number)
}

// Choix des actions de l'ennemi

function choice_enemy_conditions(enemy) {
	var i = 0
	var c = false
	while i != array_length(enemy.skills_c) && !c {
		var array = enemy.skills_c[i][1]
		if script_execute_ext(enemy.skills_c[i][0], array) {
			c = true
		} else {
			i ++
		}
	}
	return i
}

function choice_enemy_random(enemy) {
	return irandom(array_length(enemy.skills)-1)
}

// Choix de la cible ennemie

function choice_target_pv_inferior() {
	var i = 0
	var pv = team_a[0].PV
	for (var a = 1; a < array_length(team_a); a++) {
		if team_a[a].PV < pv {
			pv = team_a[a].PV
			i = a
		}
	}
	return i
}

function choice_target_pv_superior() {
	var i = 0
	var pv = team_a[0].PV
	for (var a = 1; a < array_length(team_a); a++) {
		if team_a[a].PV > pv {
			pv = team_a[a].PV
			i = a
		}
	}
	return i
}

function choice_target_random() {
	return irandom(array_length(team_a)-1)
}