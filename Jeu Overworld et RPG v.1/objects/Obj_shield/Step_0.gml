image_alpha = 1
x = player.x
y = player.y

switch(player.animation) {
	case 0:
		cc = 0
		p_anim = 0
		image_index = 0
		image_speed = 0
		depth = player.depth - 1
		if player.PV >= 0.25*player.PV_Max {
			x = player.x
			y = player.y
		} else {
			x = player.x - 2
			y = player.y + 8
		}
		break
	case 1:
		x = player.x - 5
		y = player.y + 1
		break
	case 2:
		if player.guard == 1 {
			image_alpha = 0
		} else {
			image_alpha = 1
		}
		break
	case 3:
	case 4:
	case 5:
	case 6:
		image_speed = 0
		image_alpha = 0
		break
}

if player.guard != 1 {
	x = player.x + 7
	y = player.y
}