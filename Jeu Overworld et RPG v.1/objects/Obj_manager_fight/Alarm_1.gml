impact = true

switch type_attack {
	
	case "attack":
	case "attack_magic":
		for (var i = 0; i < array_length(cible); i++) {
			
			if is_numeric(damage[i]) {
				
				cible[i].PV -= damage[i]

				if cible[i].PV <= 0 {
					cible[i].PV = 0
					alarm[2] = 20
				} else if cible[i].PV > cible[i].PV_Max {
					cible[i].PV = cible[i].PV_Max
				}
				
				if research_array(global.team, cible[i]) != noone and damage[i] > 0 {
					total_damage += damage[i]
				}
			
				if damage[i] > 1 {
					cible[i].animation = 2
					if type_attack == "attack" {
						audio_play_sound(snd_hurt, 6, false)
					} else {
						audio_play_sound(snd_strong_attack2, 6, false)
					}
				} else if damage[i] < 0 {
					color_attack[i] = c_lime
					audio_play_sound(snd_heal, 6, false)
				}
			}
		}
		
		script_effects()
		damage_show = true
		break
	case "heal_pm":
		if team_target = global.team || team_target = team_a {
			
			for (var i = 0; i < array_length(cible); i++) {
				cible[i].PM += damage[i]
				if cible[i].PM > cible[i].PM_Max {
					cible[i].PM = cible[i].PM_Max
				}
				
				color_attack[i] = c_yellow
			
			}
			
			script_effects()
			damage_show = true
			audio_play_sound(snd_heal, 6, false)
		} else {
			message_monitor = "Mais ça n'a rien fait..."
		}
		break
	case "increase":
		flashAlpha = 1
		script_effects()
		audio_play_sound(snd_increase_power, 6, false)
}