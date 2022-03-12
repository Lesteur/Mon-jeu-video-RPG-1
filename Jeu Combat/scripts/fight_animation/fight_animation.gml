function fight_animation() {
	
	switch(animation) {
	case 0:
		cc = 0
		p_anim = 0
		if guard == 1 {
			if PV >= 0.25*PV_Max {
				sprite_index = sprite_fight_neutral
				image_speed = 0.2
			} else {
				sprite_index = sprite_fight_weak
				image_speed = 0.2
			}
		}
		break
	case 1:
		sprite_index = sprite_fight_attack
		image_speed = 1
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 2:
		if guard == 1 {
			image_speed = 0.7
			sprite_index = sprite_fight_hurt
			if (image_index >= image_number - 1) {
				p_anim ++
			}
			if p_anim >= 6 {
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
		image_speed = 0.2
			sprite_index = sprite_fight_special
		} else {
			image_speed = 1
			sprite_index = sprite_fight_attack
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
		
		}
		break
	case 5:
		sprite_index = sprite_fight_object
		image_speed = 0.3
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
	case 6:
		image_speed = 0.2
		sprite_index = sprite_fight_victory
		if (image_index >= image_number - 1) {
			image_index = image_number - 1
			image_speed = 0
		}
		break
}

if guard != 1 {
	sprite_index = sprite_fight_guard
	image_speed = 1
	if (image_index >= image_number - 1) {
		image_index = image_number - 1
		image_speed = 0
	}
}

}

function fight_animation_enemy() {
	switch(animation) {
		case 0:
			sprite_index = sprite_fight_neutral
			image_speed = 0.2
			p_anim = 0
			break
		case 1:
			sprite_index = sprite_fight_attack
			image_speed = 1
			if (image_index >= image_number - 1) {
				image_index = image_number - 1
				image_speed = 0
			}
			break
		case 2:
			sprite_index = sprite_fight_hurt
			image_speed = 0.7
			if (image_index >= image_number - 1) {
				p_anim ++
			}
			if p_anim >= 6 {
				image_index = 0
				image_speed = 0
			}
			break
	}

	if (statut == "KO") && image_alpha > 0 {
		image_alpha -= 0.1
	}
}