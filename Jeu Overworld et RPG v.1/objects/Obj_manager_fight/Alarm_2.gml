for (var i = 0; i < array_length(cible); i++) {

	if cible[i].PV <= 0 {
		lower_boosts([cible[i]], 100)
		if cible[i].type == "Enemy" {
			var p = part_system_create()
			part_system_depth(p, cible[i].depth - 5)
			
			part_type_sprite(global.part_attack, effect_death, true, true, false)
			part_type_life(global.part_attack, 20, 20)
			part_particles_create(p, cible[i].x, cible[i].y, global.part_attack, 1)
			
			cible[i].status = "KO"
			ds_map_clear(cible[i].status_list)
			enemy_KO ++
			compte = 0
			message_monitor = "Le " + cible[i].name + " est vaincu !"
		} else if cible[i].type == "Ally" {
			cible[i].status = "KO"
			ds_map_clear(cible[i].status_list)
			team_KO ++
			cible[i].animation = 3
			cible[i].guard = 1
			message_monitor = "Oh non ! "+ cible[i].name +" est K.O !"
		}
	}

}