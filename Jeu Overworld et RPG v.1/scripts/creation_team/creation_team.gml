function create_team() {
	for (var i = 0; i < array_length(global.team_enemy); i++) {
		var inst = instance_create_layer(280 + i*20, 100 + i*40, "Instances_1", Obj_enemy, global.team_enemy[i])
		global.team_enemy[i] = inst
		inst.depth = -10*i
	}
	
	for (var i = 0; i<array_length(global.team_v); i++) {
		var char = instance_create_layer(0, 0, "Instances_1", Obj_player_fight, global.team_v[i])
		global.team[i] = char
	}
}

function team_overworld(x, y) {
	global.team_player = []
	instance_destroy(Obj_player)
	instance_destroy(Obj_player_follow)
	var inst = instance_create_layer(x, y, "Instances_1", Obj_player)
	inst.sprite_walk_bottom = global.team_v[0].sprite_walk_bottom
	inst.sprite_walk_top = global.team_v[0].sprite_walk_top
	inst.sprite_walk_left = global.team_v[0].sprite_walk_left
	inst.sprite_walk_right = global.team_v[0].sprite_walk_right
	inst.sprite_index = inst.sprite_walk_bottom
	inst.list = [inst.sprite_walk_bottom, inst.sprite_walk_top, inst.sprite_walk_left, inst.sprite_walk_right]
	global.player = inst
	global.team_player[0] = inst
	for (var i = 1; i < array_length(global.team_v); i++) {
		var inst = instance_create_layer(x, y, "Instances_1", Obj_player_follow)
		inst.sprite_walk_bottom = global.team_v[i].sprite_walk_bottom
		inst.sprite_walk_top = global.team_v[i].sprite_walk_top
		inst.sprite_walk_left = global.team_v[i].sprite_walk_left
		inst.sprite_walk_right = global.team_v[i].sprite_walk_right
		inst.list = [inst.sprite_walk_bottom, inst.sprite_walk_top, inst.sprite_walk_left, inst.sprite_walk_right]
		inst.order = i
		inst.sprite_index = inst.sprite_walk_bottom
		inst.following = global.team_player[i-1]
		global.team_player[i] = inst
	}
}