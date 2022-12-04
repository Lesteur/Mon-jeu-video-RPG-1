type = "Ally"

EXP_won = 0
EXP_tranche = 0

weapon = instance_create_layer(x, y, "Instances_1", weapon, equipment[? "weapon"])
weapon.player = self
if shield != noone {
	shield = instance_create_layer(x, y, "Instances_1", shield, global.basic_shield)//equipment[? "hand_object"])
	shield.player = self
}

set_equipment(id)

cc = 0
ss = 0

p_anim = 0
animation = 0

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

global.player_turn = 0
quit = 0

status = false
status_list = ds_map_create()
PF = false
spd_max = 1
spd = 1
guard = 1