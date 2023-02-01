function prepare_action(comp){
	
	lanceur.image_index = 0
	if all_target == true {
		cible = team_target
	} else {
		cible = [cible]
	}
	
	if comp.effect == "weapon" {
		effect_target = lanceur.effect
	} else {
		effect_target = comp.effect
	}
	
	if comp.sound == "weapon" {
		audio_play_sound(lanceur.sound, 6, false)
	} else if comp.sound != false {
		audio_play_sound(comp.sound, 6, false)
	}
	
}
function attack_increase(inc) {
	var typ = "bonus_stat"
	var touch_cible = []
	for (var i = 0; i < array_length(cible); i++) {
		var t = false
		for (var a = 0; a < array_length(inc); a+=3) {
			var stat = inc[a]
			var precision = 1
			var w = check_weakness(cible[i].weakness, "malus_stats", stat)
			if w != noone {
				if cible[i].weakness[w][2] == "+" {
					precision += cible[i].weakness[w][3]
				} else {
					precision = precision * cible[i].weakness[w][3]
				}
			}
			
			cible[i].animation = 1
			if precision > random(1) {
				t = true
				if inc[a+1] < 0 {
					typ = "malus_stat"
					cible[i].animation = 2
				}
				
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
		if t {
			array_insert(touch_cible, 0, cible[i])
		}
	}
	add_action([typ, lanceur, touch_cible])
}
function attack_status(sta) {
	var typ = "bonus_alt"
	var touch_cible = []
	for (var i = 0; i < array_length(cible); i++) {
		t = false
		for (var a = 0; a < array_length(sta); a+=3) {
			var alt = sta[a]
			var precision = sta[a+1]
			var w = check_weakness(cible[i].weakness, "alteration", alt)
			if w != noone {
				if cible[i].weakness[w][2] == "+" {
					precision += cible[i].weakness[w][3]
				} else {
					precision = precision * cible[i].weakness[w][3]
				}
			}
			if precision > random(1) {
				t = true
				if research_array(["burn", "freeze", "paralysis", "poison", "crippled", "antimagic", "petrific", "curse"], alt) != noone {
					typ = "malus_alt"
					cible[i].animation = 2
				}
				if w != noone {
					if cible[i].weakness[i][2] == "+" {
						precision += cible[i].weakness[w][3]
					} else {
						precision = precision * cible[i].weakness[w][3]
					}
				}
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
		if t {
			array_insert(touch_cible, 0, cible[i])
		}
	}
	
	add_action([typ, lanceur, touch_cible])
}

function Atk_normale(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 1
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, comp.puissance)
	
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
	damage_calcul(comp, comp.puissance)
	
	for (var i = 0; i < array_length(cible); i++) {
		var direct = point_direction(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var len = point_distance(lanceur.x, lanceur.y, cible[i].x, cible[i].y)
		var inst = instance_create_layer(lanceur.x, lanceur.y, "Instances_1", Obj_arrow)
		inst.player = lanceur
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
			set_equipment(id)
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
	//lanceur.animation = 4
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, comp.puissance)
	
	create_cutscene(script_execute(comp.cutscene, id, lanceur, cible))
	
	//alarm[1] = 20
	//alarm[3] = 80
}
	
function Atk_Set_Inc_Stat(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 1
	type_attack = "attack"
	
	prepare_action(comp)
	damage_calcul(comp, comp.puissance[0])
	attack_increase(comp.puissance[1])
	attack_status(comp.puissance[2])
	
	alarm[1] = 10
	alarm[3] = 70
}

function Atk_magique(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	lanceur.animation = 4.5
	type_attack = "attack_magic"
	audio_play_sound(snd_cast_spell, 6, false)
	
	prepare_action(comp)
	damage_calcul(comp, comp.puissance)
	functions_magic(comp)
	
}

function PV_recup(lance, cibl, comp){
	act = true
	lanceur = lance
	cible = cibl
	type_attack = "attack"
	var puiss = comp.puissance
	var action = "heal"
	
	prepare_action(comp)
	
	for (var i = 0; i < array_length(cible); i++) {
		if cible[i].PV <= cible[i].PV_Max*0.4 {
			action = "extreme_heal"
		}
		
		var puiss = puiss/array_length(cible)
		if (puiss < cible[i].PV_Max*puiss*0.01) {
			damage[i] = round(-cible[i].PV_Max*puiss*0.01)
		} else {
			damage[i] = -puiss
		}
		
	}
	
	add_action([action, lanceur, cible])
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
		damage[i] = round(puiss/array_length(cible))
	}
	
	add_action(["heal_pm", lanceur, cible])
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