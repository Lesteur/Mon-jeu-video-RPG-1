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

function Atk_bow(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	comp[7] = lanceur.shield[3]
	comp[3] += lanceur.shield[2]
	
	lanceur.animation = 1
	effect_target = lanceur.effect
	type_attack = "attack"
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	for (var i = 0; i < array_length(cible); i++) {
		var direct = point_direction(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var len = point_distance(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var inst = instance_create_layer(lanceur.x, lanceur.y, "Instances_1", Obj_arrow)
		inst.depth = Obj_bow.depth - 1
		inst.image_index = lanceur.shield[4]
		inst.direct = direct
		inst.len = len
		inst.cible = cible[i]
	}
	
	damage_calcul(comp, "physique")
	
	if lanceur.shield[0] != "Flèches de bois" {
		lanceur.shield[1] --
	}
	
	if lanceur.shield[1] == 0 {
		lanceur.shield = ["Flèches de bois", -1, 1, false, 0]
	}
	
	audio_play_sound(snd_attack, 6, false)
	
	alarm[0] = 70
	//alarm[1] = 10
}

function persistent_damage(cibl, dmg) {
	act = true
	cible = [cibl]
	type_attack = "attack"
	effect_target = noone
	color_attack[0] = c_white
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
	
	for(var i = 0; i < array_length(cible); i++){
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
	
	for(var i = 0; i < array_length(cible); i++){
		damage[i] = puiss/array_length(cible)
	}
	
	alarm[0] = 70
	alarm[1] = 20
}

function Increase(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = lance
	type_attack = "increase"
	var inc = comp[3]
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	for(var i = 0; i < array_length(cible); i++){
		for (var a = 0; a < array_length(inc); a++) {
			var stat = inc[a][0]
			cible[i].animation = 1
			cible[i].boost[? stat][0] += inc[a][1]
			
			if (inc[a][1] > 0 && cible[i].boost[? stat][0] >= 0) || (inc[a][1] < 0 && cible[i].boost[? stat][0] <= 0) {
				cible[i].boost[? stat][1] += inc[a][2]
			}
			
			if cible[i].boost[? stat][0] > 4 {
				cible[i].boost[? stat][0] = 4
			} else if cible[i].boost[? stat][0] < -4 {
				cible[i].boost[? stat][0] = -4
			}
			
			if cible[i].boost[? stat][1] > 5 {
				cible[i].boost[? stat][1] = 5
			}
		}
	}
	
	alarm[0] = 70
	alarm[1] = 20
}