//Obj_heros.animation = 0
//Obj_monstre.animation = 0

if lanceur.status != "KO" {
	lanceur.animation = 0
}

for (var i = 0; i < array_length(cible); i++) {
	if cible[i].status != "KO" {
		cible[i].animation = 0
	}
}

act = false
choice = 0
choice_enemy = 0
compte = 0
compte_i = 0
compte_flash = 0
flashAlpha = 0
effect_target = false
effect_lanceur = false
damage = false
damage_show = false
menu = 0
out = false
t = 0
choice_objets = 0
choice_skill = 0
impact = false
type_attack = false
all_target = noone

menu_i = 0
menu = ["action"]

team_a = []
team_enemy_a = []
for (var i = 0; i < array_length(global.team); ++i;) {
	global.team[i].PF = false
	if global.team[i].status != "KO" {
		array_insert(team_a, array_length(team_a), global.team[i])
	}
}

for (var i = 0; i < array_length(global.team_enemy); ++i;) {
	global.team_enemy[i].PF = false
	if global.team_enemy[i].status != "KO" {
		array_insert(team_enemy_a, array_length(team_enemy_a), global.team_enemy[i])
	}
}

if (global.player_turn == 1) && (target >= array_length(team_enemy_a)) && !(enemy_KO == array_length(global.team_enemy)) {
	target = array_length(team_enemy_a)-1
}

if enemy_KO == array_length(global.team_enemy) {
	issue_battle = 1
	for (var i = 0; i < array_length(global.team); ++i;) {
		global.team[i].animation = 6
		global.team[i].image_index = 0
	}
} else if team_KO == array_length(global.team) {
	issue_battle = 2
	global.team_enemy[turn].animation = 0
}

if issue_battle == 0 {
	turn++
	if turn >= array_length(turn_team) {
		turn = 0
		if global.player_turn == 1 {
			turn_fight ++
			turn_form --
			lower_boosts(global.team)
			lower_boosts(global.team_enemy)
			for (var i = 0; i < array_length(global.team); ++i;) {
				global.team[i].guard = 1
			}
			
			message_i = irandom_range(1, array_length(message_routine)-1)
			global.player_turn = 0
			turn_team = global.team
        } else {
  			global.player_turn = 1
			turn_team = global.team_enemy
		}
	}
}