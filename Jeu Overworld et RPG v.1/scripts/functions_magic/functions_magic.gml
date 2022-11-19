function functions_magic(comp){
	switch(comp.name) {
		case "Flammèche":
			for (var i = 0; i < array_length(cible); i++) {
				direction = point_direction(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
				len = point_distance(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
				var inst = instance_create_layer(lanceur.x+20, lanceur.y, "Instances_1", Obj_fireball)
				inst.depth = cible[i].depth - 5
				inst.direct = direction
				inst.len = len
				inst.cible = cible[i]
				inst.owner = lanceur
			}
			break
		case "Glaçon":
			for (var i = 0; i < array_length(cible); i++) {
				var inst = instance_create_layer(cible[i].x, cible[i].bbox_bottom, "Instances_1", Obj_iceblock)
				inst.depth = cible[i].depth - 5
				inst.owner = lanceur
			}
			break
		case "Soin":
			var puiss = comp.puissance/array_length(cible)
			var action = "heal"
			for (var i = 0; i < array_length(cible); i++) {
				var w = check_weakness(cible[i].weakness, "element", "heal")
				if cible[i].PV <= cible[i].PV_Max*0.4 {
					var action = "extreme_heal"
				}
				if w {
					color_attack[i] = c_white
					w = -(cible[i].weakness[w][3])
				} else {
					color_attack[i] = c_lime
					w = 1
				}
				if (puiss < cible[i].PV_Max*puiss*0.01) && w == 1 {
					damage[i] = -cible[i].PV_Max*puiss*0.01
				} else {
					damage[i] = -puiss*w
				}
			}
			array_pop(historique_actions)
			add_action([action, lanceur, cible])
			type_attack = "attack"
			effect_target = effect_heal_pv
			alarm[1] = 40
			alarm[3] = 100
			break
		default:
			alarm[1] = 40
			alarm[3] = 100
	}
}