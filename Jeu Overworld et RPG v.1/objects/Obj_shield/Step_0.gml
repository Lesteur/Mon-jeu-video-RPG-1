image_alpha = 1
x = Obj_Luke.x
y = Obj_Luke.y

switch(Obj_Luke.animation) {
	case 0:
		cc = 0
		p_anim = 0
		image_index = 0
		image_speed = 0
		depth = Obj_Luke.depth - 1
		if Obj_Luke.PV >= 0.25*Obj_Luke.PV_Max {
			x = Obj_Luke.x
			y = Obj_Luke.y
		} else {
			x = Obj_Luke.x - 2
			y = Obj_Luke.y + 8
		}
		break
	case 1:
		x = Obj_Luke.x - 5
		y = Obj_Luke.y + 1
		break
	case 2:
		if Obj_Luke.guard == 1 {
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

if Obj_Luke.guard != 1 {
	x = Obj_Luke.x + 7
	y = Obj_Luke.y
}