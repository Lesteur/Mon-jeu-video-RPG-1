function crea_skill(nam, pm, func, puiss, prec, port, descript, type, elem, sprite, eff = noone, snd = noone) {
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

global.sk_focus_attack = crea_skill("Concentrattaque", 5, Increase, ["attack", 1, 3], 1, 0, "Augmente l'attaque physique pour 4 tours.", 0, 0, 4, effect_increase_attack, false)
global.sk_strikblade = crea_skill("Frappalame", 5, Atk_puiss, 50, 1, 1, "Lance une puissante attaque circulaire. #Type : Tranche   Element : Neutre #Puissance : ***", "weapon", "weapon", 5, noone, snd_strong_attack1)
global.sk_fireball = crea_skill("Flammèche", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de feu. #Type : Magie   Element : Feu #Puissance : **", "magic", "fire", 0, noone, false)
global.sk_iceblock = crea_skill("Glaçon", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de glace. #Type : Magie   Element : Glace #Puissance : **", "magic", "ice", 1, noone, false)
global.sk_shock = crea_skill("Décharge", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de foudre. #Type : Magie   Element : Foudre #Puissance : **", "magic", "thunder", 2, effect_thunder, false)
global.sk_fountain = crea_skill("Fontaine", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires d'eau. #Type : Magie   Element : Eau #Puissance : **", "magic", "water", 6, effect_water, false)
global.sk_heal = crea_skill("Soin", 5, Atk_magique, 30, 0, 2, "Restaure des PV grâce à la puissance divine. #Type : Magie   Element : Soin #Puissance : **", "magic", "heal", 3, noone, false)