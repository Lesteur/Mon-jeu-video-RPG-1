function crea_skill(nam, pm, func, puiss, prec, port, descript1, descript2, util, type, elem, sprite, eff = false, snd = false, cut = noone) {
	return {
		name : nam,
		PM : pm,
		funct : func,
		puissance : puiss,
		portee : port,
		precision : prec,
		description_1 : descript1,
		description_2 : descript2,
		utilisation : util,
		type_attack : type,
		element : elem,
		graphisme : sprite,
		effect : eff,
		sound : snd,
		cutscene : cut
	}
}

function script_strikblade(id, lanceur, cible) {
	var c_x = lanceur.x
	var c_y = lanceur.y
	return [[cutscene_move_character, lanceur, [cible[0].x - 25, cible[0].y], false, 15],
			[cutscene_change_variable, lanceur, "animation", 4],
			//[cutscene_change_variable, cible[0], "animation", 2],
			[cutscene_alarm, id, 1, 1],
			[cutscene_wait, 1],
			[cutscene_change_variable, lanceur, "animation", 0],
			[cutscene_move_character, lanceur, [c_x, c_y], false, 15],
			[cutscene_alarm, id, 3, 10],
			]
}

global.sk_focus_attack = crea_skill("Concentrattaque", 5, Increase, ["attack", 1, 3], 1, 0, "Augmente l'attaque physique du personnage.#", "<player> prend une grande inspiration et canalise sa force !", 0, 0, 0, 4, effect_increase_attack)
global.sk_strikblade = crea_skill("Frappalame", 5, Atk_puiss, 50, 1, 1, "Lance un puissant coup d'épée. #", "<player> prend un grand élan et frappe l'ennemi !", 0, "weapon", "weapon", 5, "weapon", snd_strong_attack1, script_strikblade)
global.sk_fireball = crea_skill("Flammèche", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de feu. #", "<player> lance une boule de feu !", 0, "magic", "fire", 0)
global.sk_iceblock = crea_skill("Glaçon", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de glace. #", "Des pics de glace se referment sur l'ennemi !", 0, "magic", "ice", 1)
global.sk_shock = crea_skill("Décharge", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de foudre. #", "<player> fait s'abattre des éclairs sur les ennemis !", 0, "magic", "thunder", 2, effect_thunder)
global.sk_fountain = crea_skill("Fontaine", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires d'eau. #", "<player> fait apparaître une fontaine d'eau !", 0, "magic", "water", 6, effect_water)
global.sk_heal = crea_skill("Soin", 3, Atk_magique, 30, 0, 4, "Restaure des PV grâce à la puissance divine.#", "<player> lance un sort de guérison !", 2, "magic", "heal", 3)