image_alpha = 1
image_speed = 1

switch(Obj_Arthur.animation) {
	case 0:
		cc = 0
		x = Obj_Arthur.x
		y = Obj_Arthur.y
		depth = Obj_Arthur.depth - 1
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
		if Obj_Arthur.guard == 1 {
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
		depth = Obj_Arthur.depth - 1
		sprite_index = sprite_fight_special
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
}

if Obj_Arthur.guard != 1 {
	sprite_index = sprite_fight_neutral
	image_alpha = 0
}