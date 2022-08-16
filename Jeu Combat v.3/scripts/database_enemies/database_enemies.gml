global.germicroque = {
	name : "Germicroque",
	PV_Max : 500,
	PV : 500,
	attack : 11,
	magic_attack : 3,
	defense : 9,
	magic_defense : 5,
	accuracy : 11,
	agility : 8,
	element : false,
	type_attack : "bite",
	effect : effect_bite,
	sprite_fight_neutral : germicroque_neutral,
	sprite_fight_hurt : germicroque_hurt,
	sprite_fight_attack : germicroque_fight,
	skills : [crea_skill("Photosynthèse", 0, PV_recup, 15, 0, 0, "Germicroque se soigne !", "heal", false, 0),
			  crea_skill("Esprit de bête", 0, Increase, ["attack", 1, 3], 0, 0, "Germicroque se renforce !", "increase", false, 0),
			  crea_skill("Croc carnivore", 0, Atk_normale, 15, 1, 1, "Germicroque attaque !", "bite", false, 0)],
	skills_c : [[PV_inferior, [0.85]], [stats_inferior, ["attack", 0]]],
	choice_enemy_skill : choice_enemy_conditions,
	choice_enemy_target : choice_target_random,
	weakness : [["type", "slash", "bonus_dmg", 0.5], ["element", "fire", "bonus_dmg", 1], ["element", "heal", "bonus_dmg", 2], ["object", "potion_heal_1", persistent_damage, 100]],
	strength : [["element", "ice", "malus_dmg", 0.33], ["element", "thunder", "malus_dmg", 1]],
	gold : 20,
	experience : 10,
	booty : ["potion_heal_1", 2, "potion_energy_1", 1]
}