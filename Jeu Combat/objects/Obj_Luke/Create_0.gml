Name = "Luke"
Type = "Ally"
Num = 0
Classe = "Epéiste"
Attack = 7
Magic_attack = 4
Defense = 10
Magic_defense = 5
PV_Max = 80
PV = PV_Max
PM_Max = 15
PM = PM_Max
status = false
PF = false
guard = 1

weapon = Obj_sword
shield = Obj_shield
cc = 0

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


//boost = [[1, 0], [1, 0]]
boost = ds_map_create()
boost[? "attack"] = [1, 0]
boost[? "magic_attack"] = [1, 0]
boost[? "defense"] = [1, 0]
boost[? "magic_defense"] = [1, 0]
boost[? "agility"] = [1, 0]
boost[? "accuracy"] = [1, 0]

global.player_turn = 0
animation = 0
effect = basic_sword_effect

Basic_attack = ["Taillade", 0, Atk_normale, 20, 1, 0, "weapon", "weapon"]

skills = [ ["Monte-Attaque", 5, Atk_montee, 1.5, 0, "Augmente l'attaque physique pour 4 tours."],
		   ["Frappalame", 5, Atk_puiss, 50, 1, "Lance une puissante attaque circulaire. #Type : Tranche   Element : Neutre #Puissance : ***", "weapon", "weapon"] ]

global.inventory = [
["Potion soin", 5, PV_recup, 20, "Une potion médicinale qui rend 20 PV à un allié."],
["Elixir", 3, PM_recup, 10, "Une potion un peu forte qui rend 10 PM à un allié."]
]

Element = false//Obj_sword.Element
Type_attack = "slash"//Obj_sword.Type
Weakness = []
Strength = []