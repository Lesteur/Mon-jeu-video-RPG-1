image_alpha = 1
image_speed = 1

switch(player.animation) {
	case 0:
		cc = 0
		x = player.x
		y = player.y
		depth = player.depth - 1
		image_index = 0
		sprite_index = sprite_fight_neutral
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
		image_speed = 0
		depth = player.depth - 1
		sprite_index = sprite_fight_special
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
}

if player.guard != 1 {
	sprite_index = sprite_fight_neutral
	image_alpha = 0
}