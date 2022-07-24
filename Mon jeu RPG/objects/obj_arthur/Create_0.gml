name = "Arthur"
type = "Ally"
Num = 2
classe = "Archer"
attack = 14
magic_attack = 3
defense = 7
magic_defense = 4
PV_Max = 70
PV = PV_Max
PM_Max = 15
PM = PM_Max
agility = 7
accuracy = 11
status = false
PF = false
guard = 1

weapon = Obj_bow
shield = ["Flèches de fer", 3, 7, false, 1]
cc = 0
ss = 0

p_anim = 0
animation = 0
sprite_fight_attack = Arthur_fight_attack
sprite_fight_guard = Arthur_fight_guard
sprite_fight_hurt = Arthur_fight_hurt
sprite_fight_KO = Arthur_fight_KO
sprite_fight_neutral = Arthur_fight_neutral
sprite_fight_object = Arthur_fight_object
sprite_fight_special = Arthur_fight_special
sprite_fight_victory = Arthur_fight_victory
sprite_fight_weak = Arthur_fight_weak

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

global.player_turn = 0
animation = 0
effect = basic_bow_effect

Basic_attack = ["Tir de flèche", 0, Atk_bow, 15, 1, 1, 0, "weapon", "weapon"]

skills = [ ["Monte-Attaque", 5, Increase, [["attack", 1, 3]], 1, 0, "Augmente l'attaque physique pour 4 tours.", 0, 0, 4] ]

element = false
type_attack = "pierce"
weakness = []
strength = []