function set_weak2(weakness) {
	switch(weakness[2]) {
		case "bonus_dmg":
			weak += weakness[3]
			break
		case "malus_dmg":
			strength = strength * weakness[3]
			break
		case "absorb_dmg":
			strength = strength * -weakness[3]
		//case "immunity":
		//	strength = 0
		//	break
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

function damage_calcul(comp, type){
	
	//var boost = lanceur.boost[0][0]
	var puiss = comp[3]
	
	var typ = comp[6]
	if comp[6] == "weapon" {
		typ = lanceur.weapon.Type_attack
	}
	
	var elem = comp[7]
	if comp[7] == "weapon" {
		elem = lanceur.weapon.Element
	}
	
	weak = 1
	strength = 1
	
	for(var i = 0; i < array_length(cible); i++) {
		
		weak = 1
		strength = 1
		
		if type == "magic" {
			var att = lanceur.Magic_attack
			var def = cible[i].Magic_defense
			var att_boost = lanceur.boost[? "magic_attack"][0]
			var def_boost = lanceur.boost[? "magic_defense"][0]
		} else {
			var att = lanceur.Attack
			var def = cible[i].Defense
			var att_boost = lanceur.boost[? "attack"][0]
			var def_boost = lanceur.boost[? "defense"][0]
		}
		
		var array_weak = cible[i].Weakness
		var array_strength = cible[i].Strength
		set_weak1(array_weak, typ, elem)
		set_weak1(array_strength, typ, elem)
		
		switch comp[7] {
			case false:
				color_attack[i] = c_white
				break
			case "fire":
				color_attack[i] = c_red
				break
			case "ice":
				color_attack[i] = c_teal
				break
			case "thunder":
				color_attack[i] = c_yellow
				break
		}
		
		if weak >= 1.5 {
			cible[i].PF = true
		}
		
		damage[i] = round((att * (puiss/array_length(cible)) * att_boost * weak * strength) / (def*cible[i].guard)*def_boost )
	}
	
}