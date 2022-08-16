function create_team() {
	for (var i = 0; i < array_length(global.team_enemy); i++) {
		var inst = instance_create_layer(280 + i*20, 100 + i*40, "Instances_1", Obj_enemy, global.team_enemy[i])
		global.team_enemy[i] = inst
		inst.depth = -10*i
	}
}