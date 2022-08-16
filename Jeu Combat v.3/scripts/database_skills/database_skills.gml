function crea_skill(nam, pm, func, puiss, prec, port, descript, type, elem, sprite) {
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
		graphisme : sprite
	}
}