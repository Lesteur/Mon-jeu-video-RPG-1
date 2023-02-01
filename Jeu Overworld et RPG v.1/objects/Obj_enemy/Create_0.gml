type = "Enemy"

status = false
letter = ""
status_list = ds_map_create()
weapon = noone
shield = noone
guard = 1
PF = false
spd_max = spd

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

booty = []
array_copy(booty, 0, booty_n, 0, array_length(booty_n))
for (var i = 0; i < array_length(booty); i+= 2) {
	booty[i] = variable_global_get(booty[i])
}

ss = 0
zz = 0
animation = 0

depth = 50