function crea_object(nam, nam_conj, n, stor, func, puiss, port, descript, util, sprite, eff, snd) {
	return {
		name : nam,
		name_conj : nam_conj,
		num : n,
		storage : stor,
		funct : func,
		puissance : puiss,
		portee : port,
		description_1 : descript,
		utilisation : util,
		graphisme_1 : sprite,
		effect : eff,
		sound : snd
	}
}

global.potion_heal_1 = {
	name : "potion de soin",
	name_conj : ["fem", "potions de soin"],
	num : 12,
	storage : "inventory",
	funct : PV_recup,
	puissance : 30,
	portee : 3,
	description_1 : "Une potion médicinale qui rend une petite quantité de PV.",
	utilisation : 2,
	graphisme_1 : 0,
	effect : effect_heal_pv,
	sound : snd_heal
}

global.potion_energy_1 = {
	name : "potion d'énergie",
	name_conj : ["fem", "potions d'énergie"],
	num : 1,
	storage : "inventory",
	funct : PM_recup,
	puissance : 10,
	portee : 3,
	description_1 : "Une potion un peu forte qui rend 10 PM à un allié.",
	utilisation : 2,
	graphisme_1 : 1,
	effect : effect_heal_pm,
	sound : snd_heal
}

global.mushroom_poison = {
	name : "amanite poisonite",
	name_conj : ["fem", "amanites poisonite"],
	num : 2,
	storage : "inventory",
	funct : Set_status,
	puissance : ["poison", 1, 2],
	portee : 1,
	description_1 : "Ceux qui mangent ce drôle de champignon sans se demander s'il peut être toxique finissent bien évidemment par le regretter...",
	utilisation : 0,
	graphisme_1 : 5,
	effect : effect_poison_1,
	sound : snd_heal
}

global.stone_burn = {
	name : "pierre charbon",
	name_conj : ["fem", "pierres charbon"],
	num : -2,
	storage : "inventory",
	funct : Set_status,
	puissance : ["burn", 1, 2],
	portee : 1,
	description_1 : "Cette pierre est capable de générer du feu en permanence... Attention à ne pas vous brûler ! Chaud chaud chaud !",
	utilisation : 0,
	graphisme_1 : 2,
	effect : effect_burn,
	sound : snd_heal
}

global.star_freeze = {
	name : "étoile de gel",
	name_conj : ["fem", "étoiles de gel"],
	num : 8,
	storage : "inventory",
	funct : Set_status,
	puissance : ["freeze", 1, 2],
	portee : 1,
	description_1 : "Ce petit cristal en forme d'étoile peut geler quelqu'un instantanément si #elle est lancée.",
	utilisation : 0,
	graphisme_1 : 3,
	effect : basic_sword_effect,
	sound : snd_heal
}

global.stone_volt = {
	name : "pierre volt",
	name_conj : ["fem", "pierres volt"],
	num : -5,
	storage : "inventory",
	funct : Set_status,
	puissance : ["paralysis", 1, 2],
	portee : 1,
	description_1 : "Cette pierre en forme de cylindre contient pas mal d'énergie électrique #malgré sa petite taille.",
	utilisation : 0,
	graphisme_1 : 4,
	effect : effect_paralysis,
	sound : snd_heal
}

global.inventory = [ global.potion_heal_1, 2, global.potion_energy_1, 3, global.mushroom_poison, 1, global.stone_burn, 1, global.star_freeze, 2, global.stone_volt, 1]