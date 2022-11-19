// Find enemy
set_depth()

if global.interact == 0 {
	script_execute(state_list[state])
}

var _enemy = instance_place(x, y, Obj_player)

// Exit room
if ( _enemy != noone && Obj_player.alarm[0] < 0) && global.interact == 0 && state != states.paralys {
	begin_battle(global.team_v, enemies)
	global.room_data[? room_n][data] = 1
	global.fight = 1
}