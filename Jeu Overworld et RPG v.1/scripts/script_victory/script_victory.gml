function script_victory() {
	issue_battle = 1
	lower_boosts(team_a, 10)
	EXP_won = 0
	galas = 0
	var lvl = 0
	for (var i = 0; i < array_length(global.team_enemy); i++) {
		lvl += global.team_enemy[i].level
		EXP_won += global.team_enemy[i].experience
		galas += global.team_enemy[i].gold
	}
	lvl = round(lvl/array_length(global.team_enemy))
	strategy = strategy_points*100
	defil = 0
	loot = []
	grade = fight_result(strategy, turn_battle, total_damage, lvl)
	EXP_won = round(EXP_won*EXP_mult(grade))
	add_loot()
	add_inventory(loot)
	global.money += galas
	for (var i = 0; i < array_length(global.team); ++i) {
		global.team[i].animation = 6
		global.team[i].image_index = 0
		global.team[i].EXP_won = EXP_won
	}
}