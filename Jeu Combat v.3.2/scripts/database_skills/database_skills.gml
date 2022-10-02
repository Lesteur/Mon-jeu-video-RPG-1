function crea_skill(nam, pm, func, puiss, prec, port, descript, type, elem, sprite, eff, snd) {
	return {
		name : nam,
		PM : pm,
		funct : func,
		puissance : puiss,
		portee : port,
		precision : prec,
		description_1 : descript,
		type_attack : type,
		element : elem,
		graphisme : sprite,
		effect : eff,
		sound : snd
	}
}

function crea_skill2(nam, pm, func, puiss_1, puiss_2, prec, port, descript, type, elem, sprite, eff, snd) {
	return {
		name : nam,
		PM : pm,
		funct : func,
		puissance : puiss_1,
		puissance_x : puiss_2,
		portee : port,
		precision : prec,
		description_1 : descript,
		type_attack : type,
		element : elem,
		graphisme : sprite,
		effect : eff,
		sound : snd
	}
}