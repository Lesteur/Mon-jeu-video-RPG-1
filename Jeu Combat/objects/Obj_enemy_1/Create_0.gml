Name = "Germi 1"
Type = "Enemy"
Attack = 7
Magic_attack = 3
Defense = 5
Magic_defense = 5
PV_Max = 500
PV = PV_Max
status = false
weapon = false
shield = false
guard = 1
PF = false

boost = [[1, 0], [1, 0]]

animation = 0
effect = effect_bite

depth = 50

sprite_fight_neutral = germicroque_neutral
sprite_fight_hurt = germicroque_hurt
sprite_fight_attack = germicroque_fight

skills = [["Croc carnivore", 0, Atk_normale, 15, 1, "Germicroque attaque !", "bite", false],
		  ["Photosynthèse", 0, PV_recup, 20, 0, "Germicroque se soigne !", "heal", false],
		  ["Esprit de bête", 0, Atk_montee, 1.2, 0, "Germicroque se renforce !", "increase", false]]

Element = false
Type_attack = "bite"
Weakness = [["type", "slash", "bonus_dmg", 0.5], ["element", "fire", "bonus_dmg", 1]]
Strength = [["element", "ice", "malus_dmg", 0.6], ["element", "thunder", "malus_dmg", 0.6]]