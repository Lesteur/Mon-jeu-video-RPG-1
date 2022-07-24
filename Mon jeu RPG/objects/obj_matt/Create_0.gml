name = "Matthieu"
type = "Ally"
Num = 1
classe = "Mage"
attack = 3
magic_attack = 12
defense = 7
magic_defense = 13
PV_Max = 60
PV = PV_Max
PM_Max = 25
PM = 25
agility = 7
accuracy = 4
status = false
PF = false
guard = 1

weapon = Obj_staff
shield = noone
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
effect = basic_staff_effect

Basic_attack = ["Coup de bâton", 0, Atk_normale, 20, 1, 1, 0, "weapon", "weapon"]

skills = [ ["Flammèche", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de feu. #Type : Magie   Element : Feu #Puissance : **", "magic", "fire", 0],
		["Glaçon", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de glace. #Type : Magie   Element : Glace #Puissance : **", "magic", "ice", 1],
		["Décharge", 5, Atk_magique, 40, 0, 2, "Inflige des dégats élémentaires de foudre. #Type : Magie   Element : Foudre #Puissance : **", "magic", "thunder", 2],
		["Soin", 5, Atk_magique, 30, 0, 2, "Restaure des PV grâce à la puissance divine. #Type : Magie   Element : Soin #Puissance : **", "magic", "heal", 3]]

element = false
type_attack = "magic"
weakness = []
strength = []