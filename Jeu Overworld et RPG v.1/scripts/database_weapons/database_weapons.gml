global.wood_arrow = {
	name : "Flèche basique",
	attack : 1,
	element : false,
	type_attack : "pierce",
	type_equipment : "arrow",
	graphisme : 0
}

global.steel_arrow = {
	name : "Flèche d'acier",
	attack : 6,
	element : false,
	type_attack : "pierce",
	type_equipment : "arrow",
	graphisme : 1
}

global.basic_sword = {
	name : "Epée normale",
	attack : 5,
	magic_attack : 0,
	defense : 0,
	magic_defense : 0,
	accuracy : 0,
	agility : 0,
	element : false,
	type_attack : "slash",
	type_equipment : "sword",
	sprite_fight_neutral : basic_sword_neutral,
	sprite_fight_attack : basic_sword_attack,
	sprite_fight_special : basic_sword_special,
	sprite_fight_weak : basic_sword_weak,
	effect : basic_sword_effect,
	sound : snd_attack
}

global.basic_staff = {
	name : "Bâton normal",
	attack : 2,
	magic_attack : 4,
	defense : 0,
	magic_defense : 0,
	accuracy : 0,
	agility : 0,
	element : false,
	type_attack : false,
	type_equipment : "staff",
	sprite_fight_neutral : basic_staff_neutral,
	sprite_fight_attack : basic_staff_attack,
	sprite_fight_special : basic_staff_special,
	sprite_fight_weak : basic_staff_weak,
	effect : basic_staff_effect,
	sound : snd_attack
}

global.basic_bow = {
	name : "Arc normal",
	attack : 6,
	magic_attack : 0,
	defense : 0,
	magic_defense : 0,
	accuracy : 0,
	agility : 0,
	element : false,
	type_attack : "pierce",
	type_equipment : "bow",
	sprite_fight_neutral : basic_bow_neutral,
	sprite_fight_attack : basic_bow_attack,
	sprite_fight_special : basic_bow_special,
	sprite_fight_weak : false,
	effect : basic_bow_effect,
	sound : snd_bow_neutral
}