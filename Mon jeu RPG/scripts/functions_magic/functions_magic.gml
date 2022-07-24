function functions_magic(comp){
	switch(comp[0]) {
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
				var inst = instance_create_layer(cible[i].x, cible[i].y, "Instances_1", Obj_iceblock)
				inst.depth = cible[i].depth - 5
			}
			break
		case "Décharge":
			for (var i = 0; i < array_length(cible); i++) {
				var inst = instance_create_layer(cible[i].x, cible[i].y, "Instances_1", Obj_thunder)
				inst.depth = cible[i].depth - 5
			}
			break
		case "Soin":
			for (var i = 0; i < array_length(cible); i++) {
				var w = check_weakness(cible[i].Weakness, "element", "heal")
				if w {
					w = -(cible[i].Weakness[w][3])
				} else {
					w = 1
				}
				damage[i] = -comp[3]/array_length(cible)*w
			}
			type_attack = "attack"
			effect_target = effect_heal_pv
			lanceur.cc = -1000
			lanceur.weapon.cc = -1000
			alarm[0] = 70
			alarm[1] = 20
			break
	}
}