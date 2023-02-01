function set_weak2(weakness) {
	switch(weakness[2]) {
		case "bonus_dmg":
			wk += weakness[3]
			break
		case "malus_dmg":
			stgth += weakness[3]
			break
		case "absorb_dmg":
			wk = wk * -weakness[3]
			stgth = 1
			break
	}
}

function set_weak1(array, type, element) {
	for(var a = 0; a < array_length(array); a++) {
		switch(array[a][0]) {
			case "type":
				if type == array[a][1] {
					set_weak2(array[a])
				}
				break
			case "element":
				if element == array[a][1] {
					set_weak2(array[a])
				}
				break
		}
	}
}

function damage_calcul(comp, puiss){
	
	var typ = comp.type_attack
	if typ == "weapon" {
		if lanceur.weapon != noone {
			typ = lanceur.weapon.type_attack
		} else {
			typ = lanceur.type_attack
		}
	}
	
	var elem = comp.element
	if elem == "weapon" {
		if lanceur.weapon != noone {
			elem = lanceur.weapon.element
		} else {
			elem = lanceur.element
		}
	}
	
	var PF = "attack"
	var touch_enemies = []
	for (var i = 0; i < array_length(cible); i++) {
		
		wk = 1
		stgth = 1
		
		if turn_team == team_a {
			wk += 0.1*(4-turn)
		}
		if team_target == team_a {
			stgth += 1/(1-0.1*turn)
		}
		
		if typ == "magic" {
			var att = lanceur.magic_attack
			var def = cible[i].magic_defense
			var att_boost = global.boost_num[? string(lanceur.boost[? "magic_attack"][0])]
			var def_boost = global.boost_num[? string(cible[i].boost[? "magic_defense"][0])]
		} else {
			var att = lanceur.attack
			var def = cible[i].defense
			var att_boost = global.boost_num[? string(lanceur.boost[? "attack"][0])]
			var def_boost = global.boost_num[? string(cible[i].boost[? "defense"][0])]
		}
		
		var array_weak = cible[i].weakness
		set_weak1(array_weak, typ, elem)
		wk = wk * effect_status(comp, i)
		
		if wk >= 1.5 {
			var PF = "weakness"
		}
		
		color_attack[i] = global.color_element[? elem]
		
		var acc_boost = global.boost_num[? string(lanceur.boost[? "accuracy"][0])]
		var agi_boost = global.boost_num[? string(cible[i].boost[? "agility"][0])]
		
		if comp.precision == 0 {
			var precision = 1
		} else {
			var precision = comp.precision * (lanceur.accuracy*acc_boost) / (cible[i].agility*agi_boost)
		}
		
		if precision > random(1) {
			damage[i] = round((random_range(0.9, 1.1) * att * (puiss/array_length(cible))*att_boost*wk) / (def*cible[i].guard *def_boost*stgth))
			array_insert(touch_enemies, array_length(touch_enemies), cible[i])
		} else {
			damage[i] = "miss"
			cible[i].PF = false
		}
	}
	add_action([PF, lanceur, touch_enemies])
	
}