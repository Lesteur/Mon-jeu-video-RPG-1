for (var i = 0; i < array_length(cible); i++) {

	if cible[i].PV <= 0 {
		if cible[i].Type == "Enemy" {
		  cible[i].status = "KO"
		  enemy_KO ++
		  compte = 0
		  effect_target = effect_death
		  message_monitor = "Le germicroque est vaincu !"
		} else if cible[i].Type == "Ally" {
		  cible[i].status = "KO"
		  team_KO ++
		  cible[i].animation = 3
		  cible[i].guard = 1
		  message_monitor = "Oh non ! "+ cible[i].Name +" est K.O !"
		}
	}

}