image_alpha = 1
image_speed = 1

switch(Obj_Luke.animation) {
	case 0:
		cc = 0
		x = Obj_Luke.x
		y = Obj_Luke.y
		depth = Obj_Luke.depth + 1
		image_index = 0
		//image_speed = 0
		if Obj_Luke.PV >= 0.25*Obj_Luke.PV_Max {
			sprite_index = sprite_fight_neutral
		} else {
			sprite_index = sprite_fight_weak
		}
		break
	case 1:
		sprite_index = basic_sword_attack
		//image_speed = 1
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 2:
		if Obj_Luke.guard == 1 {
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
		cc ++
		if cc <= 40 {
			depth = Obj_Luke.depth - 1
			//image_speed = 0.7
			sprite_index = basic_sword_special
		} else {
			//image_speed = 1
			sprite_index = basic_sword_attack
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
		}
		break
}

if Obj_Luke.guard != 1 {
	sprite_index = sprite_fight_neutral
	x = Obj_Luke.x - 2
}