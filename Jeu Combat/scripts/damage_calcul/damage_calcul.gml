function set_weak2(weakness) {
	switch(weakness[2]) {
		case "bonus_dmg":
			weak += weakness[3]
			break
		case "malus_dmg":
			strength = strength * weakness[3]
			break
		case "immunity":
			strength = 0
			break
	}
}

function set_weak1(array, comp) {
	for(var a = 0; a < array_length(array); a++) {
		switch(array[a][0]) {
			case "type":
				if comp[6] == array[a][1] {
					set_weak2(array[a])
				}
				//if comp[6] == genre[a][1] {
				//	f += 0.5
				//}
				break
			case "element":
				if comp[7] == array[a][1] {
					set_weak2(array[a])
				}
				//if comp[7] == genre[a][1] {
					//cible[i].PF = true
				//	f += 1
				//}
				break
		}
	}
}


function damage_calcul(comp, type){
	
	var boost = lanceur.boost[0][0]
	var puiss = comp[3]
	
	if comp[6] == "weapon" {
		comp[6] = lanceur.weapon.Type_attack
	}
	
	if comp[7] == "weapon" {
		comp[7] = lanceur.weapon.Element
	}
	
	weak = 1
	strength = 1
	
	for(var i = 0; i < array_length(cible); i++) {
		
		if type == "magic" {
			var att = lanceur.Attaque_magique
			var def = cible[i].Defense_magique
		} else {
			var att = lanceur.Attaque
			var def = cible[i].Defense
		}
		
		var array_weak = cible[i].Weakness
		var array_strength = cible[i].Strength
		set_weak1(array_weak, comp)
		set_weak1(array_strength, comp)
		
		//for(var a = 0; a < array_length(array_weak); a++) {
			//if array_weak[a][0] == "type" {
			//	if comp[6] == array_weak[a][1] {
			//		weak += 0.5
			//	}
			//} else if array_weak[a][0] == "element" {
			//	if comp[7] == array_weak[a][1] {
			//		cible[i].PF = true
			//		weak += 1
			//	}
			//}
		//}
		
		damage[i] = round((att * (puiss/array_length(cible)) * boost * weak * strength) / (def*cible[i].guard))
	}
	
}