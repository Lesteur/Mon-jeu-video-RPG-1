state = states.idle
state_list = [idle_behaviour, wander_behaviour, alert_behaviour, paralys_behaviour]
count = 0
spd = 0.5
begin_x = x
begin_y = y
my_dir = irandom_range(0, 359)
moveX = lengthdir_x(spd, my_dir)
moveY = lengthdir_y(spd, my_dir)

var liste = global.room_data[? room_n]
if liste[data] == 1 {
	instance_destroy()
}