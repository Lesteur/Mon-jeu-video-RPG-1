/// Effets de statuts

var array = ds_map_keys_to_array(lanceur.status_list)
var list = []
array_copy(list, 0, cible, 0, array_length(cible))
cible = [lanceur]

if i_status < array_length(array) && lanceur.spd == 1 {
	var alt = array[i_status]
	alarm[0] = 0
	switch (alt) {
		case "poison":
			cible[0].animation = 2
			type_attack = "attack"
			effect_target = effect_poison
			color_attack[0] = c_purple
			t = 0
			cible[0].PF = false
			damage[0] = round((cible[0].PV_Max * 0.1) * random_range(0.95, 1.05))
			i_status ++
			alarm[1] = 1
			alarm[3] = 70
			break
		case "burn":
			type_attack = "attack"
			effect_target = noone
			color_attack[0] = c_red
			t = 0
			cible[0].PF = false
			var array_weak = cible[0].weakness
			wk = 1
			stgth = 1
			set_weak1(array_weak, "alt", "fire")
			damage[0] = round(((cible[0].PV_Max * 0.05) * random_range(0.95, 1.05)* wk)/stgth)
			i_status ++
			if damage[0] > 0 {
				cible[0].animation = 2
			}
			alarm[1] = 1
			alarm[3] = 70
			break
		default:
			i_status ++
			alarm[3] = 1
			break
	}
} else {
	cible[0].animation = 0
	cible = list
	alarm[0] = 1
}