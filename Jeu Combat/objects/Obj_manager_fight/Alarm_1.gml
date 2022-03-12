impact = true

switch type_attack {
	
	case "attack":
	
		for (var i = 0; i < array_length(cible); i++) {
			cible[i].PV -= damage[i]

			if cible[i].PV <= 0 {
				cible[i].PV = 0
				alarm[2] = 20
			}
			
			if damage[i] > 1 {
				cible[i].animation = 2
			}
			
		}
		damage_show = true
		audio_play_sound(snd_hurt, 6, false)
		break
		
	case "attack_magic":
	
		for (var i = 0; i < array_length(cible); i++) {
			cible[i].PV -= damage[i]

			if cible[i].PV <= 0 {
				cible[i].PV = 0
				alarm[2] = 20
			}
		
			if damage[i] > 1 {
				flashAlpha = 1
				cible[i].animation = 2
			}
		
		}
		
		damage_show = true
		audio_play_sound(snd_strong_attack2, 6, false)
		break
	case "heal_pv":
	
		for (var i = 0; i < array_length(cible); i++) {
			cible[i].PV += damage[i]
			if cible[i].PV > cible[i].PV_Max {
				cible[i].PV = cible[i].PV_Max
			}
		
			for(var a = 0; a < 5; a++) {
				part_particles_create(global.partSystem100, cible[i].bbox_left + 6*a -3, cible[i].bbox_bottom - irandom(cible[i].bbox_top/2), global.part_heal, 1)
			}
		
		}
		
		damage_show = true
		flashAlpha = 1
		audio_play_sound(snd_heal, 6, false)
		break
	case "heal_pm":
		if team_target = global.team || team_target = team_a {
			
			for (var i = 0; i < array_length(cible); i++) {
				cible[i].PM += damage[i]
				if cible[i].PM > cible[i].PM_Max {
					cible[i].PM = cible[i].PM_Max
				}
			
				for(var a = 0; a < 5; a++) {
					part_particles_create(global.partSystem100, cible[i].bbox_left + 6*a -3, cible[i].bbox_bottom - irandom(cible[i].bbox_top/2), global.part_heal_pm, 1)
				}
			
			}
			
			damage_show = true
			flashAlpha = 1
			
			audio_play_sound(snd_heal, 6, false)
		} else {
			message_monitor = "Mais ça n'a rien fait..."
		}
		break
	case "increase":
		flashAlpha = 1
		
		for (var i = 0; i < array_length(cible); i++) {
			var dir = 45
			part_type_direction(global.part_inc_att, dir, dir, 0, 0)
			repeat(4) {
				part_particles_create(global.partSystem100, cible[i].x, cible[i].y, global.part_inc_att, 1)
				dir += 90
				part_type_direction(global.part_inc_att, dir, dir, 0, 0)
			}
		}
		
		audio_play_sound(snd_heal, 6, false)
}