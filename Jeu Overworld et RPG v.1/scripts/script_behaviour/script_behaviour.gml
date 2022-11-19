function idle_behaviour() {
	count ++
	if count >= room_speed*3 {
		var change = choose(0, 1)
		switch(change) {
			case 0:
				state = states.wander
			case 1:
				count = 0
				break
		}
	}
	if collision_circle(x, y, 100, Obj_player, false, false) {
		state = states.alert
	}
}

function wander_behaviour() {
	count ++
	if (!place_meeting(x + spd, y, Obj_collision) && moveX > 0) || (!place_meeting(x - spd, y, Obj_collision) && moveX < 0) {
		x += moveX
	}
	if (!place_meeting(x, y + spd, Obj_collision) && moveY > 0) || (!place_meeting(x, y - spd, Obj_collision) && moveY < 0) {
		y += moveY
	}
	if count >= room_speed*3 {
		var change = choose(0, 1)
		switch(change) {
			case 0:
				state = states.idle
			case 1:
				my_dir = irandom_range(0, 359)
				moveX = lengthdir_x(spd, my_dir)
				moveY = lengthdir_y(spd, my_dir)
				count = 0
				break
		}
	}
	if collision_circle(x, y, 100, Obj_player, false, false) {
		state = states.alert
	}
}

function alert_behaviour() {
	my_dir = point_direction(x, y, Obj_player.x, Obj_player.y)
	moveX = lengthdir_x(spd*2, my_dir)
	moveY = lengthdir_y(spd*2, my_dir)
	if (!place_meeting(x + spd, y, Obj_collision) && moveX > 0) || (!place_meeting(x - spd, y, Obj_collision) && moveX < 0) {
		x += moveX
	}
	if (!place_meeting(x, y + spd, Obj_collision) && moveY > 0) || (!place_meeting(x, y - spd, Obj_collision) && moveY < 0) {
		y += moveY
	}
	if !collision_circle(x, y, 100, Obj_player, false, false) {
		state = states.idle
	}
}

function paralys_behaviour() {
	count ++
	if count mod 10 = 0 {
		image_alpha = 0
	} else {
		image_alpha = 1
	}
	if count >= room_speed*5 {
		state = states.idle
		image_alpha = 1
	}
}