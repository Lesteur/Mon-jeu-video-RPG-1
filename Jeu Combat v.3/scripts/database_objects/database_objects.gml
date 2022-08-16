function crea_object(nam, func, puiss, descript, sprite) {
	return {
		name : nam,
		funct : func,
		puissance : puiss,
		description_1 : descript,
		graphisme_1 : sprite
	}
}

global.potion_heal_1 = {
	name : "Potion de soin",
	funct : PV_recup,
	puissance : 20,
	description_1 : "Une potion médicinale qui rend 20 PV à un allié.",
	graphisme_1 : 0
}

global.potion_energy_1 = {
	name : "Potion d'énergie",
	funct : PM_recup,
	puissance : 10,
	description_1 : "Une potion un peu forte qui rend 10 PM à un allié.",
	graphisme_1 : 1
}