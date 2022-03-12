Nom = "Matthieu"
Type = "Ally"
Num = 1
Classe = "Mage"
Attaque = 3
Attaque_magique = 12
Defense = 7
Defense_magique = 13
PV_Max = 60
PV = PV_Max
PM_Max = 25
PM = 25
statut = false
PF = false

weapon = Obj_staff
shield = false
cc = 0

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


boost = [[1, 0], [1, 0]]
guard = 1

global.player_turn = 0
animation = 0
effect = basic_staff_effect

Basic_attack = ["Coup de bâton", 0, Atk_normale, 20, 1, 0, "weapon", "weapon"]

skills = [ ["Flammèche", 5, Atk_magique, 40, 2, "Inflige des dégats élémentaires de feu. #Type : Magie   Element : Feu #Puissance : **", "magic", "fire"],
		["Glaçon", 5, Atk_magique, 40, 2, "Inflige des dégats élémentaires de glace. #Type : Magie   Element : Glace #Puissance : **", "magic", "ice"],
		["Décharge", 5, Atk_magique, 40, 2, "Inflige des dégats élémentaires de foudre. #Type : Magie   Element : Foudre #Puissance : **", "magic", "thunder"],
		["Soin", 5, Atk_magique, 30, 2, "Restaure des PV grâce à la puissance divine. #Type : Magie   Element : Soin #Puissance : **", "magic", "heal"]]

Element = false//weapon.Element
Type_attack = "magic"//weapon.Type
Weakness = []
Strength = []