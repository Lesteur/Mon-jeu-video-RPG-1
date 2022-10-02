function crea_object(nam, func, puiss, port, descript, sprite, eff, snd) {
	return {
		name : nam,
		funct : func,
		puissance : puiss,
		portee : port,
		description_1 : descript,
		graphisme_1 : sprite,
		effect : eff,
		sound : snd
	}
}

global.potion_heal_1 = {
	name : "Potion de soin",
	true_name : "potion_heal_1",
	funct : PV_recup,
	puissance : 20,
	portee : 0,
	description_1 : "Une potion médicinale qui rend une petite quantité de PV.",
	graphisme_1 : 0,
	effect : effect_heal_pv,
	sound : snd_heal
}

global.potion_energy_1 = {
	name : "Potion d'énergie",
	true_name : "potion_energy_1",
	funct : PM_recup,
	puissance : 10,
	portee : 0,
	description_1 : "Une potion un peu forte qui rend 10 PM à un allié.",
	graphisme_1 : 1,
	effect : effect_heal_pm,
	sound : snd_heal
}

global.mushroom_poison = {
	name : "Amanite poisonite",
	true_name : "mushroom_poison",
	funct : Set_status,
	puissance : ["poison", 1, 2],
	portee : 1,
	description_1 : "Ceux qui mangent ce drôle de champignon sans se demander s'il peut être toxique finissent bien évidemment par le regretter...",
	graphisme_1 : 5,
	effect : effect_poison_1,
	sound : snd_heal
}

global.stone_burn = {
	name : "Pierre charbon",
	true_name : "stone_burn",
	funct : Set_status,
	puissance : ["burn", 1, 2],
	portee : 1,
	description_1 : "Cette pierre est capable de générer du feu en permanence... Attention à ne pas vous brûler ! Chaud chaud chaud !",
	graphisme_1 : 2,
	effect : effect_burn,
	sound : snd_heal
}

global.star_freeze = {
	name : "Étoile de gel",
	true_name : "star_freeze",
	funct : Set_status,
	puissance : ["freeze", 1, 2],
	portee : 1,
	description_1 : "Ce petit cristal en forme d'étoile peut geler quelqu'un instantanément si elle est lancée.",
	graphisme_1 : 3,
	effect : basic_sword_effect,
	sound : snd_heal
}

global.stone_volt = {
	name : "Pierre volt",
	true_name : "stone_volt",
	funct : Set_status,
	puissance : ["paralysis", 1, 2],
	portee : 1,
	description_1 : "Cette pierre en forme de cylindre contient pas mal d'énergie électrique malgré sa petite taille.",
	graphisme_1 : 4,
	effect : effect_paralysis,
	sound : snd_heal
}