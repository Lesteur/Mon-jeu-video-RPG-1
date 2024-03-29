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
			}
			break
		case "Glaçon":
			for (var i = 0; i < array_length(cible); i++) {
				var inst = instance_create_layer(cible[i].x, cible[i].bbox_bottom, "Instances_1", Obj_iceblock)
				inst.depth = cible[i].depth - 5
			}
			break
		case "Décharge":
			for (var i = 0; i < array_length(cible); i++) {
				var inst = instance_create_layer(cible[i].x, cible[i].bbox_bottom, "Instances_1", Obj_thunder)
				inst.depth = cible[i].depth - 5
			}
			break
		case "Soin":
			var puiss = comp.puissance/array_length(cible)
			for (var i = 0; i < array_length(cible); i++) {
				var w = check_weakness(cible[i].weakness, "element", "heal")
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
			type_attack = "attack"
			effect_target = effect_heal_pv
			lanceur.cc = -1000
			lanceur.weapon.cc = -1000
			alarm[1] = 40
			alarm[3] = 100
			break
		default:
			alarm[1] = 40
			alarm[3] = 100
	}
}