function prepare_action(comp){
	
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	if comp.effect == undefined {
		effect_target = lanceur.effect
	} else {
		effect_target = comp.effect
	}
	
	if comp.sound == undefined {
		if comp.sound != noone {
			audio_play_sound(lanceur.sound, 6, false)
		}
	} else {
		audio_play_sound(comp.sound, 6, false)
	}
	
}
function attack_increase(inc) {
	for (var i = 0; i < array_length(cible); i++) {
		for (var a = 0; a < array_length(inc); a+=3) {
			var stat = inc[a]
			var precision = 1
			var w = check_weakness(cible[i].weakness, "malus_stats", stat)
			if w {
				if cible[i].weakness[i][2] == "+" {
					precision += cible[i].weakness[w][3]
				} else {
					precision = precision * cible[i].weakness[w][3]
				}
			}
			
			if precision > random(1) {
				cible[i].animation = 1
				cible[i].boost[? stat][0] += inc[a+1]
				if (inc[a+1] > 0 && cible[i].boost[? stat][0] >= 0) || (inc[a+1] < 0 && cible[i].boost[? stat][0] <= 0) {
					cible[i].boost[? stat][1] += inc[a+2]
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
	}
}
function attack_status(sta) {
	for (var i = 0; i < array_length(cible); i++) {
		for (var a = 0; a < array_length(sta); a+=3) {
			var alt = sta[a]
			var precision = sta[a+1]
			var w = check_weakness(cible[i].weakness, "alteration", alt)
			if w {
				if cible[i].weakness[i][2] == "+" {
					precision += cible[i].weakness[w][3]
				} else {
					precision = precision * cible[i].weakness[w][3]
				}
			}
			if precision > random(1) {
				cible[i].animation = 2
				var array = ds_map_keys_to_array(cible[i].status_list)
				if !research_array(array, alt) {
					cible[i].status_list[? alt] = sta[a+2]
				} else {
					cible[i].status_list[? alt] += sta[a+2]
					if cible[i].status_list[? alt] > 4 {
						cible[i].status_list[? alt] = 4
					}
				}
			}
		}
	}
}

function Atk_normale(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 1
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, "physique")
	
	alarm[1] = 10
	alarm[3] = 70
}

function Atk_bow(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 1
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, "physique")
	
	for (var i = 0; i < array_length(cible); i++) {
		var direct = point_direction(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var len = point_distance(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var inst = instance_create_layer(lanceur.x, lanceur.y, "Instances_1", Obj_arrow)
		inst.depth = Obj_bow.depth - 1
		inst.image_index = lanceur.equipment[? "hand_object"][0].graphisme
		inst.direct = direct
		inst.len = len
		inst.cible = cible[i]
	}
	
	if lanceur.equipment[? "hand_object"][0] != global.wood_arrow {
		lanceur.equipment[? "hand_object"][1] --
	}
	
	if lanceur.equipment[? "hand_object"][1] == 0 {
		lanceur.equipment[? "hand_object"] = [global.wood_arrow, -1]
		with lanceur {
			set_equipment()
		}
	}
}

function persistent_damage(lance, cibl, dmg){
	act = true
	lanceur = lance
	cible = [cibl]
	type_attack = "attack"
	effect_target = noone
	color_attack[0] = c_white
	damage[0] = dmg
	alarm[1] = 20
	alarm[3] = 80
}

function Atk_puiss(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 4
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, "physique")
	
	alarm[1] = 20
	alarm[3] = 80
}

function Atk_magique(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 4
	type_attack = "attack_magic"
	comp.sound = snd_cast_spell
	
	prepare_action(comp)
	damage_calcul(comp, "magic")
	functions_magic(comp)
	
}

function PV_recup(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	type_attack = "attack"
	var puiss = comp.puissance
	
	prepare_action(comp)
	
	for (var i = 0; i < array_length(cible); i++) {
		
		var puiss = puiss/array_length(cible)
		if (puiss < cible[i].PV_Max*puiss*0.01) {
			damage[i] = -cible[i].PV_Max*puiss*0.01
		} else {
			damage[i] = -puiss
		}
		
	}
	
	alarm[1] = 20
	alarm[3] = 80
}

function PM_recup(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	type_attack = "heal_pm"
	var puiss = comp.puissance
	
	prepare_action(comp)
	
	for(var i = 0; i < array_length(cible); i++){
		damage[i] = puiss/array_length(cible)
	}
	
	alarm[1] = 20
	alarm[3] = 80
}

function Set_status(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	type_attack = "increase"
	var sta = comp.puissance
	
	prepare_action(comp)
	attack_status(sta)
	
	alarm[1] = 20
	alarm[3] = 80
}

function Increase(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	type_attack = "increase"
	var inc = comp.puissance
	
	prepare_action(comp)
	attack_increase(inc)
	
	alarm[1] = 20
	alarm[3] = 80
}