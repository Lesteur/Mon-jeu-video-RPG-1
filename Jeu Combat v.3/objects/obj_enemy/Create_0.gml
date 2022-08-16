type = "Enemy"

status = false
weapon = noone
shield = noone
guard = 1
PF = false

boost = ds_map_create()
boost[? "attack"] = [0, 0]
boost[? "magic_attack"] = [0, 0]
boost[? "defense"] = [0, 0]
boost[? "magic_defense"] = [0, 0]
boost[? "agility"] = [0, 0]
boost[? "accuracy"] = [0, 0]

for (var i = 0; i < array_length(booty); i+= 2) {
	booty[i] = variable_global_get(booty[i])
}

ss = 0
animation = 0

depth = 50