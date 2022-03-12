image_alpha = 1
image_speed = 1

switch(Obj_Matt.animation) {
	case 0:
		cc = 0
		x = Obj_Matt.x
		y = Obj_Matt.y
		depth = Obj_Matt.depth -1
		image_index = 0
		if Obj_Matt.PV >= 0.25*Obj_Matt.PV_Max {
			sprite_index = sprite_fight_neutral
		} else {
			sprite_index = sprite_fight_weak
		}
		break
	case 1:
		sprite_index = basic_staff_attack
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 2:
		if Obj_Matt.guard == 1 {
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
			depth = Obj_Matt.depth -1
			sprite_index = basic_staff_special
		} else {
			sprite_index = basic_staff_attack
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
		}
		break
}

if Obj_Matt.guard != 1 {
	sprite_index = sprite_fight_neutral
	x = Obj_Matt.x - 1
}