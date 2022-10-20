name = "Matthieu"
type = "Ally"
Num = 1
classe = "Mage"

PV_Max = 60
PV = PV_Max
PM_Max = 25
PM = 25

real_attack = 3
real_magic_attack = 12
real_defense = 7
real_magic_defense = 13
real_agility = 7
real_accuracy = 4

EXP = 0
Niveau = 1
EXP_restant = courbe_exp(2)
EXP_won = 0
EXP_tranche = 0

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
equipment[? "weapon"] = global.basic_staff
equipment[? "hand_object"] = global.basic_shield
weapon = instance_create_layer(x, y, "Instances_1", Obj_staff, equipment[? "weapon"])
shield = noone
set_equipment()

cc = 0
ss = 0

p_anim = 0
animation = 0
sprite_fight_attack = Matt_fight_attack
sprite_fight_guard = Matt_fight_guard
sprite_fight_hurt = Matt_fight_hurt
sprite_fight_KO = Matt_fight_KO
sprite_fight_neutral = Matt_fight_neutral
sprite_fight_object = Matt_fight_object
sprite_fight_special = Matt_fight_special
sprite_fight_victory = Matt_fight_victory
sprite_fight_weak = Matt_fight_weak

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

global.player_turn = 0
animation = 0

Basic_attack = crea_skill("Coup de bâton", 0, Atk_normale, 20, 1, 1, 0, "weapon", "weapon", 0)

skills = [ crea_skill("Flammèche", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de feu. #Type : Magie   Element : Feu #Puissance : **", "magic", "fire", 0),
		crea_skill("Glaçon", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de glace. #Type : Magie   Element : Glace #Puissance : **", "magic", "ice", 1),
		crea_skill("Décharge", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de foudre. #Type : Magie   Element : Foudre #Puissance : **", "magic", "thunder", 2),
		crea_skill("Soin", 5, Atk_magique, 30, 0, 2, "Restaure des PV grâce à la puissance divine. #Type : Magie   Element : Soin #Puissance : **", "magic", "heal", 3),
		crea_skill("Fontaine", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires d'eau. #Type : Magie   Element : Eau #Puissance : **", "magic", "water", 6, effect_water)]

weakness = []
strength = []