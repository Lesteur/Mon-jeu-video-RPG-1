database_equip_1()
database_weapons()
database_skills()

var equip1 = ds_map_create()
equip1[? "weapon"] = global.basic_sword
equip1[? "hand_object"] = global.basic_shield
equip1[? "protection"] = global.basic_armour
equip1[? "equip_1"] = global.basic_boots
equip1[? "equip_2"] = global.basic_gloves
equip1[? "equip_3"] = noone

global.Luke = {
	name : "Luke",
	name_conj : ["masc", "propre"],
	classe : "Epéiste",
	Num : 0,

	PV_Max : 80,
	PV : 40,
	PV_c : [2.143, 20.5, 57.4],
	
	PM_Max : 10,
	PM : 10,
	PM_c : [0.113, 6.5, 3.4],

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
	
	Basic_attack : crea_skill("Taillade", 0, Atk_normale, 20, 1, 1, "", "<player> attaque !", 0, "weapon", "weapon", 0, "weapon", "weapon"),

	skills : [global.sk_focus_attack, global.sk_strikblade],

	weakness : [],
	strength : []
}
set_equipment(global.Luke, false)

var equip2 = ds_map_create()
equip2[? "equip_1"] = global.basic_boots
equip2[? "equip_2"] = global.basic_gloves
equip2[? "equip_3"] = noone
equip2[? "protection"] = global.basic_armour
equip2[? "weapon"] = global.basic_staff
equip2[? "hand_object"] = global.basic_shield

global.Matt = {
	name : "Matthieu",
	name_conj : ["masc", "propre"],
	classe : "Mage",
	Num : 1,

	PV_Max : 60,
	PV : 60,
	PV_c : [1.126, 31, 26.9],
	
	PM_Max : 15,
	PM : 15,
	PM_c : [0.2815, 8, 6.7],

	real_attack : 10,
	attack_c : [0.0049, 1.2, 8.8],
	
	real_magic_attack : 15,
	magic_attack_c : [0.1734, 2.7, 12],
	
	real_defense : 10,
	defense_c : [-0.0828, 9.1, 1],
	
	real_magic_defense : 15,
	magic_defense_c : [0.0604, 6.2, 8.7],
	
	real_agility : 5,
	agility_c : [0.0584, -0.26, 5.2],
	
	real_accuracy : 5,
	accuracy_c : [0.0417, -0.085, 5],
	
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
	
	Basic_attack : crea_skill("Coup de bâton", 0, Atk_normale, 20, 1, 1, "", "<player> attaque !", 0, "weapon", "weapon", 0, "weapon", "weapon"),

	skills : [global.sk_fireball, global.sk_iceblock, global.sk_shock, global.sk_fountain, global.sk_heal],

	weakness : [],
	strength : []
}
set_equipment(global.Matt, false)

var equip3 = ds_map_create()
equip2[? "equip_1"] = global.basic_boots
equip2[? "equip_2"] = global.basic_gloves
equip2[? "equip_3"] = noone
equip2[? "protection"] = global.basic_armour
equip3[? "weapon"] = global.basic_bow
equip3[? "hand_object"] = [global.steel_arrow, 2]

global.Arthur = {
	name : "Arthur",
	name_conj : ["masc", "propre"],
	classe : "Archer",
	Num : 2,

	PV_Max : 70,
	PV : 70,
	PV_c : [1.1845, 36.7, 32.1],
	
	PM_Max : 15,
	PM : 15,
	PM_c : [0.1179, 2.7, 12.2],

	real_attack : 10,
	attack_c : [0.0795, 6.8, 3.0],
	
	real_magic_attack : 5,
	magic_attack_c : [-0.1149, 12, -6.9],
	
	real_defense : 10,
	defense_c : [-0.0316, 6.8, 3.2],
	
	real_magic_defense : 15,
	magic_defense_c : [0.0331, 5.3, 9.6],
	
	real_agility : 5,
	agility_c : [0.0857, 0.62, 4.3],
	
	real_accuracy : 10,
	accuracy_c : [0.1149, 3, 6.9],
	
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
	
	Basic_attack : crea_skill("Tir de flèche", 0, Atk_bow, 15, 1, 1, "", "<player> attaque !", 0, "weapon", "weapon", 0, "weapon", "weapon"),

	skills : [global.sk_focus_attack],

	weakness : [],
	strength : []
}
set_equipment(global.Arthur, false)

global.characters = [global.Luke, global.Matt, global.Arthur]
global.team_v = [global.Luke, global.Matt, global.Arthur]