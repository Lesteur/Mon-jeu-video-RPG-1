function script_effects(){
	
	if effect_target != false {
		part_type_sprite(global.part_attack, effect_target, true, true, false)
		var spd = sprite_get_speed(effect_target)/2
		part_type_life(global.part_attack, spd, spd)
	
		switch(effect_target) {
			case effect_heal_pv:
				flashAlpha = 1
				for (var i = 0; i < array_length(cible); i++) {
					var p = part_system_create()
					part_system_depth(p, cible[i].depth - 5)
					for(var a = 0; a < 5; a++) {
						part_particles_create(p, cible[i].bbox_left + 6*a -3, cible[i].bbox_bottom - irandom(cible[i].bbox_top/2), global.part_heal, 1)
					}
				}
				break
			case effect_heal_pm:
				flashAlpha = 1
				for (var i = 0; i < array_length(cible); i++) {
					var p = part_system_create()
					part_system_depth(p, cible[i].depth - 5)
					for(var a = 0; a < 5; a++) {
						part_particles_create(p, cible[i].bbox_left + 6*a -3, cible[i].bbox_bottom - irandom(cible[i].bbox_top/2), global.part_heal_pm, 1)
					}
				}
				break
			case effect_poison:
				for (var i = 0; i < array_length(cible); i++) {
					var p = part_system_create()
					part_system_depth(p, cible[i].depth - 5)
					var dir = 50
					var tab = [1, 0.75, 1.25]
					for (var a = 0; a < 3; a++) {
						var va = tab[a]
						part_type_direction(global.part_Poison, dir, dir, 0, 0)
						part_type_life(p, 40*va, 40*va)
						part_type_size(global.part_Poison, va, va, 0, 0)
						part_particles_create(p, cible[i].x, cible[i].y, global.part_Poison, 1)
						dir += 40
					}
				}
				break
			default:
				for (var i = 0; i < array_length(cible); i++) {
					var p = part_system_create()
					part_system_depth(p, cible[i].depth - 1)
					part_particles_create(p, cible[i].x, cible[i].y, global.part_attack, 1)
				}
		}
	}
	
}