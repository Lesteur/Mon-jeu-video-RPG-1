image_alpha = 1
image_speed = 1

switch(player.animation) {
	case 0:
		cc = 0
		x = player.x
		y = player.y
		depth = player.depth -1
		image_index = 0
		if player.PV >= 0.25*player.PV_Max {
			sprite_index = sprite_fight_neutral
		} else {
			sprite_index = sprite_fight_weak
		}
		break
	case 1:
		sprite_index = sprite_fight_attack
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 2:
		if player.guard == 1 {
			image_alpha = 0
		} else {
			image_alpha = 1
		}
		break
	case 3:
	case 5:
	case 6:
		image_speed = 0
		image_alpha = 0
		break
	case 4:
	case 4.5:
		sprite_index = sprite_fight_special
		depth = player.depth -1
		if image_index >= 8 {
			image_speed = 2
			player.image_speed = 2
		}
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
}

if player.guard != 1 {
	sprite_index = sprite_fight_neutral
	x = player.x - 1
}