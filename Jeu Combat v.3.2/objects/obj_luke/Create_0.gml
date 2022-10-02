name = "Luke"
type = "Ally"
Num = 0
classe = "Epéiste"

PV_Max = 80
PV = PV_Max
PM_Max = 15
PM = PM_Max

real_attack = 7
real_magic_attack = 4
real_defense = 10
real_magic_defense = 5
real_agility = 4
real_accuracy = 6

status = false
status_list = ds_map_create()
PF = false
spd_max = 1
spd = 1
guard = 1

equipment = ds_map_create()
equipment[? "equip_1"] = global.basic_armour
equipment[? "equip_2"] = global.basic_boots
equipment[? "equip_3"] = global.basic_gloves
equipment[? "weapon"] = global.basic_sword
equipment[? "hand_object"] = global.basic_shield

weapon = instance_create_layer(x, y, "Instances_1", Obj_sword, equipment[? "weapon"])
shield = instance_create_layer(x, y, "Instances_1", Obj_shield, equipment[? "hand_object"])
set_equipment()
cc = 0
ss = 0

p_anim = 0
animation = 0
sprite_fight_attack = Luke_fight_attack
sprite_fight_guard = Luke_fight_guard
sprite_fight_hurt = Luke_fight_hurt
sprite_fight_KO = Luke_fight_KO
sprite_fight_neutral = Luke_fight_neutral
sprite_fight_object = Luke_fight_object
sprite_fight_special = Luke_fight_special
sprite_fight_victory = Luke_fight_victory
sprite_fight_weak = Luke_fight_weak

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

global.player_turn = 0

Basic_attack = crea_skill("Taillade", 0, Atk_normale, 20, 1, 1, 0, "weapon", "weapon", 0)

skills = [crea_skill("Monte-Attaque", 5, Increase, ["attack", 1, 3], 1, 0, "Augmente l'attaque physique d'un niveau.", 0, 0, 4, effect_increase_attack, noone),
		  crea_skill("Frappalame", 5, Atk_puiss, 50, 1, 1, "Lance une puissante attaque circulaire. #Type : Tranche   Element : Neutre #Puissance : ***", "weapon", "weapon", 5, undefined, snd_strong_attack1)]

global.inventory = [ global.potion_heal_1, 2, global.potion_energy_1, 3, global.mushroom_poison, 1, global.stone_burn, 1, global.star_freeze, 2, global.stone_volt, 1 ]

weakness = []
strength = []