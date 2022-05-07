function Atk_normale(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	
	lanceur.animation = 1
	effect_target = lanceur.effect
	type_attack = "attack"
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	damage_calcul(comp, "physique")
	
	audio_play_sound(snd_attack, 6, false)
	
	alarm[0] = 70
	alarm[1] = 10
}

function persistent_damage(cibl, dmg) {
	act = true
	cible = [cibl]
	type_attack = "attack"
	effect_target = noone
	damage[0] = dmg
	alarm[0] = 70
	alarm[1] = 20
}

function Atk_puiss(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	
	if all_target == "all" {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	lanceur.animation = 4
	effect_target = lanceur.effect
	type_attack = "attack"
	
	damage_calcul(comp, "physique")
	
	audio_play_sound(snd_attack, 6, false)
	
	alarm[0] = 80
	alarm[1] = 20
}

function Atk_magique(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	
	lanceur.animation = 4
	type_attack = "attack_magic"
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	damage_calcul(comp, "magic")
	
	audio_play_sound(snd_cast_spell, 6, false)
	
	functions_magic(comp)
	
}

function PV_recup(lance, cibl, comp){
	act = true
	cible = cibl
	type_attack = "attack"
	var puiss = comp[3]
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	for(var i = 0; i < array_length(cible); i++) {
		damage[i] = -puiss/array_length(cible)
	}
	
	effect_target = effect_heal_pv
	
	alarm[0] = 70
	alarm[1] = 20
}

function PM_recup(lance, cibl, comp){
	act = true
	cible = cibl
	type_attack = "heal_pm"
	var puiss = comp[3]
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	for(var i = 0; i < array_length(cible); i++) {
		damage[i] = puiss/array_length(cible)
	}
	
	alarm[0] = 70
	alarm[1] = 20
}

function Atk_montee(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = lance
	type_attack = "increase"
	var puiss = comp[3]
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	for(var i = 0; i < array_length(cible); i++) {
		cible[i].animation = 1
		//cible[i].boost[0][0] = puiss
		//cible[i].boost[0][1] = 4
		cible[i].boost[? "attack"][0] = puiss
		cible[i].boost[? "attack"][1] = 4
	}
	
	alarm[0] = 70
	alarm[1] = 20
}

function Def_montee(lance, cibl, puiss){
	act = true
	lanceur = lance
	
	type_attack = "increase"
	lanceur.animation = 1
	lanceur.Defense += puiss
}

function Def_baisse(lance, cibl, puiss){
	act = true
	cible = cibl
	
	cible.Defense -= puiss
	
	if cible.Defense <= 0 {
		cible.Defense = 1
	}
}