database_armours()
database_weapons()
database_skills()

var equip1 = ds_map_create()
equip1[? "equip_1"] = global.basic_armour
equip1[? "equip_2"] = global.basic_boots
equip1[? "equip_3"] = global.basic_gloves
equip1[? "weapon"] = global.basic_sword
equip1[? "hand_object"] = global.basic_shield

global.Luke = {
	name : "Luke",
	classe : "Epéiste",
	Num : 0,

	PV_Max : 80,
	PV : 80,
	PM_Max : 15,
	PM : 15,

	real_attack : 10,
	attack_c : [0.113, 6.5, 3.4],
	
	real_magic_attack : 5,
	magic_attack_c : [0.0187, 1.3, 3.7],
	
	real_defense : 10,
	defense_c : [0.113, 6.5, 3.4],
	
	real_magic_defense : 5,
	magic_defense_c : [0.0857, 0.6, 4.3],
	
	real_agility : 4,
	agility_c : [0.0296, 0.7, 3.3],
	
	real_accuracy : 8,
	accuracy_c : [0.0115, 1.3, 6.5],
	
	EXP : 0,
	Niveau : 1,
	EXP_restant : courbe_exp(2),
	
	equipment : equip1,
	weapon : Obj_sword,
	shield : Obj_shield,
	
	sprite_fight_attack : Luke_fight_attack,
	sprite_fight_guard : Luke_fight_guard,
	sprite_fight_hurt : Luke_fight_hurt,
	sprite_fight_KO : Luke_fight_KO,
	sprite_fight_neutral : Luke_fight_neutral,
	sprite_fight_object : Luke_fight_object,
	sprite_fight_special : Luke_fight_special,
	sprite_fight_victory : Luke_fight_victory,
	sprite_fight_weak : Luke_fight_weak,
	
	sprite_walk_bottom : Luke_walk_bottom,
	sprite_walk_top : Luke_walk_top,
	sprite_walk_left : Luke_walk_left,
	sprite_walk_right : Luke_walk_right,
	
	Basic_attack : crea_skill("Taillade", 0, Atk_normale, 20, 1, 1, 0, "weapon", "weapon", 0),

	skills : [crea_skill("Monte-Attaque", 5, Increase, ["attack", 1, 3], 1, 0, "Augmente l'attaque physique d'un niveau.", 0, 0, 4, effect_increase_attack, false),
			  crea_skill("Frappalame", 5, Atk_puiss, 50, 1, 1, "Lance une puissante attaque circulaire. #Type : Tranche   Element : Neutre #Puissance : ***", "weapon", "weapon", 5, noone, snd_strong_attack1)],

	weakness : [],
	strength : []
}

var equip2 = ds_map_create()
equip2[? "equip_1"] = global.basic_armour
equip2[? "equip_2"] = global.basic_boots
equip2[? "equip_3"] = global.basic_gloves
equip2[? "weapon"] = global.basic_staff
equip2[? "hand_object"] = global.basic_shield

global.Matt = {
	name : "Matthieu",
	classe : "Mage",
	Num : 1,

	PV_Max : 60,
	PV : 60,
	PM_Max : 25,
	PM : 25,

	real_attack : 3,
	real_magic_attack : 12,
	real_defense : 7,
	real_magic_defense : 13,
	real_agility : 7,
	real_accuracy : 4,
	
	EXP : 0,
	Niveau : 1,
	EXP_restant : courbe_exp(2),
	
	equipment : equip2,
	weapon : Obj_staff,
	shield : noone,
	
	sprite_fight_attack : Matt_fight_attack,
	sprite_fight_guard : Matt_fight_guard,
	sprite_fight_hurt : Matt_fight_hurt,
	sprite_fight_KO : Matt_fight_KO,
	sprite_fight_neutral : Matt_fight_neutral,
	sprite_fight_object : Matt_fight_object,
	sprite_fight_special : Matt_fight_special,
	sprite_fight_victory : Matt_fight_victory,
	sprite_fight_weak : Matt_fight_weak,
	
	sprite_walk_bottom : Matt_walk_bottom,
	sprite_walk_top : Matt_walk_top,
	sprite_walk_left : Matt_walk_left,
	sprite_walk_right : Matt_walk_right,
	
	Basic_attack : crea_skill("Coup de bâton", 0, Atk_normale, 20, 1, 1, 0, "weapon", "weapon", 0),

	skills : [crea_skill("Flammèche", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de feu. #Type : Magie   Element : Feu #Puissance : **", "magic", "fire", 0, noone, false),
			crea_skill("Glaçon", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de glace. #Type : Magie   Element : Glace #Puissance : **", "magic", "ice", 1, noone, false),
			crea_skill("Décharge", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de foudre. #Type : Magie   Element : Foudre #Puissance : **", "magic", "thunder", 2, noone, false),
			crea_skill("Soin", 5, Atk_magique, 30, 0, 2, "Restaure des PV grâce à la puissance divine. #Type : Magie   Element : Soin #Puissance : **", "magic", "heal", 3, noone, false),
			crea_skill("Fontaine", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires d'eau. #Type : Magie   Element : Eau #Puissance : **", "magic", "water", 6, effect_water, false)],

	weakness : [],
	strength : []
}

var equip3 = ds_map_create()
equip3[? "equip_1"] = global.basic_armour
equip3[? "equip_2"] = global.basic_boots
equip3[? "equip_3"] = global.basic_gloves
equip3[? "weapon"] = global.basic_bow
equip3[? "hand_object"] = [global.steel_arrow, 2]

global.Arthur = {
	name : "Arthur",
	classe : "Archer",
	Num : 2,

	PV_Max : 70,
	PV : 70,
	PM_Max : 15,
	PM : 15,

	real_attack : 14,
	real_magic_attack : 3,
	real_defense : 7,
	real_magic_defense : 4,
	real_agility : 7,
	real_accuracy : 11,
	
	EXP : 0,
	Niveau : 1,
	EXP_restant : courbe_exp(2),
	
	equipment : equip3,
	weapon : Obj_bow,
	shield : noone,
	
	sprite_fight_attack : Arthur_fight_attack,
	sprite_fight_guard : Arthur_fight_guard,
	sprite_fight_hurt : Arthur_fight_hurt,
	sprite_fight_KO : Arthur_fight_KO,
	sprite_fight_neutral : Arthur_fight_neutral,
	sprite_fight_object : Arthur_fight_object,
	sprite_fight_special : Arthur_fight_special,
	sprite_fight_victory : Arthur_fight_victory,
	sprite_fight_weak : Arthur_fight_weak,
	
	sprite_walk_bottom : Arthur_walk_bottom,
	sprite_walk_top : Arthur_walk_top,
	sprite_walk_left : Arthur_walk_left,
	sprite_walk_right : Arthur_walk_right,
	
	Basic_attack : crea_skill("Tir de flèche", 0, Atk_bow, 15, 1, 1, 0, "weapon", "weapon", 0),

	skills : [crea_skill("Monte-Attaque", 5, Increase, ["attack", 1, 3], 1, 0, "Augmente l'attaque physique pour 4 tours.", 0, 0, 4, effect_increase_attack, false)],

	weakness : [],
	strength : []
}

global.characters = [global.Luke, global.Matt, global.Arthur]
global.team_v = [global.Matt, global.Arthur, global.Luke]
//global.team_v = [global.Luke, global.Matt, global.Arthur]