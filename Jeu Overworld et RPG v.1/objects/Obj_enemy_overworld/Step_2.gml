// Find enemy
var _enemy = instance_place(x, y, Obj_player)

// Exit room
if ( _enemy != noone && Obj_player.alarm[0] < 0) {
	begin_battle(global.team_v, [global.germicroque, global.germicroque])
	global.room_data[? room_n][data] = 1
	global.fight = 1
	instance_destroy()
}