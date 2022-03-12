function fight_animation() {
	image_speed = 1
	
	switch(animation) {
	case 0:
		cc = 0
		if guard == 1 {
			if PV >= 0.25*PV_Max {
				sprite_index = sprite_fight_neutral
			} else {
				sprite_index = sprite_fight_weak
			}
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
		if guard == 1 {
			sprite_index = sprite_fight_hurt
			if (image_index >= image_number - 1) {
				cc ++
			}
			if cc >= 6 {
				image_index = 0
				image_speed = 0
			}
		}
		break
	case 3:
		image_speed = 0
		sprite_index = sprite_fight_KO
		break
	case 4:
		cc ++
		if cc <= 40 {
			sprite_index = sprite_fight_special
		} else {
			sprite_index = sprite_fight_attack
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
		
		}
		break
	case 5:
		sprite_index = sprite_fight_object
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 6:
		sprite_index = sprite_fight_victory
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
}

if guard != 1 {
	sprite_index = sprite_fight_guard
	if (image_index >= image_number - 1) {
		image_index = image_number - 1
		image_speed = 0
	}
}

}

function fight_animation_enemy() {
	image_speed = 1
	
	switch(animation) {
		case 0:
			sprite_index = sprite_fight_neutral
			cc = 0
			break
		case 1:
			sprite_index = sprite_fight_attack
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
			break
		case 2:
			sprite_index = sprite_fight_hurt
			if (image_index >= image_number - 1) {
				cc ++
			}
			if cc >= 6 {
				image_index = 0
				image_speed = 0
			}
			break
	}

	if (status == "KO") && image_alpha > 0 {
		image_alpha -= 0.1
	}
}