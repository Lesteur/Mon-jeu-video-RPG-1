// Ajustement du texte

draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(Font_menu)
draw_set_color(c_white)

// Variables divers

var PV_allies = []
var PM_allies = []
var PV_enemies = []

for (var i = 0; i < array_length(global.team); ++i;) {
	PV_allies[i] = ((global.team[i].PV_Max-global.team[i].PV)/global.team[i].PV_Max)*100
	PM_allies[i] = ((global.team[i].PM_Max-global.team[i].PM)/global.team[i].PM_Max)*100
}

for (var i = 0; i < array_length(team_enemy_a); ++i;) {
	PV_enemies[i] = (team_enemy_a[i].PV/team_enemy_a[i].PV_Max)*100
}

// Draw de l'interface et des vie des persos

draw_sprite(monitor_fight, 0, 0, 560)

for (var i = 0; i < array_length(global.team); ++i;) {
	var m_effect = menu_effect
	if i != turn {
		m_effect = 0
	}
	
	if global.team[i].Classe == "Mage" {
		draw_sprite(menu_2, choice, 200*i, 442)
	} else {
		draw_sprite(menu_1, choice, 200*i, 442)
	}
	
	draw_sprite(fiche_stats_fight, global.team[i].Num, i*200, 442-m_effect)
	
	if global.team[i].boost[0][1] > 0 {
		draw_sprite(inc_stats, 0, i*200 + 46, 442-m_effect - 8)
	}
	
	draw_text(101+200*i, 412-m_effect, string(global.team[i].PV)+"/"+string(global.team[i].PV_Max))
	draw_healthbar(100+200*i, 408-m_effect, 189+200*i, 415-m_effect, PV_allies[i], c_black, c_black, c_black, 1, 0, 0)
	
	draw_text(101+200*i, 432-m_effect, string(global.team[i].PM)+"/"+string(global.team[i].PM_Max))
	draw_healthbar(100+200*i, 428-m_effect, 189+200*i, 435-m_effect, PM_allies[i], c_black, c_black, c_black, 1, 0, 0)
}

if ((menu[menu_i] == "target") || (menu[menu_i] == "skills_target") || (menu[menu_i] == "objects_target")) && !act {
	
	if all_target == false && array_length(team_target) > 1 {
		draw_sprite(monitor_target, 0, 800, 0)
	} else if all_target == true && array_length(team_target) > 1 {
		draw_sprite(monitor_target, 1, 800, 0)
	}
	
	if all_target == false || all_target == noone {
		if team_target == team_enemy_a {
			draw_healthbar(230, 470, 230+180, 470+10,PV_enemies[target], c_red, c_green, c_green, 0, 1, 0)
		}
	}
	
	if all_target == false || all_target == noone {
		draw_sprite_ext(pointeur, 0, team_target[target].x*2-60, team_target[target].y*2, 2, 2, 0, c_white, 1)
	} else {
		for(var i = 0; i < array_length(team_target); i++) {
			draw_sprite_ext(pointeur, 0, team_target[i].x*2-60, team_target[i].y*2, 2, 2, 0, c_white, 1)
		}
	}
}

// Affichage du tour

draw_set_valign(fa_top)
draw_set_font(Font_mini)

if message_quick != false && message_quick_t > 0 {
	draw_text_ext(30, 465, string_hash_to_newline(message_quick), 30, 740)
	message_quick_t --
} else {
	draw_text_ext(30, 465, string_hash_to_newline(message_monitor), 30, 740)
}

// Affichage des effets et des dégats

if target < array_length(team_target) {
	var c = team_target[target]
	var wea = c.weapon
	var shi = c.shield
}

if impact {
	var c = []
	c = cible[0]
	var wea = c.weapon
	var shi = c.shield
}

if (flashAlpha > 0) && c.status != "KO" {
	shader_set(shader_flash)
	if all_target == false || all_target == noone {
		draw_sprite_ext(c.sprite_index, c.image_index, c.x*2, c.y*2, 2, 2, 0, c_white, flashAlpha)
		if wea && wea.image_alpha != 0 {
			draw_sprite_ext(wea.sprite_index, wea.image_index, wea.x*2, wea.y*2, 2, 2, 0, c_white, flashAlpha)
		}
		if shi && shi.image_alpha != 0 {
			draw_sprite_ext(shi.sprite_index, shi.image_index, shi.x*2, shi.y*2, 2, 2, 0, c_white, flashAlpha)
		}
	} else if all_target == true {
		for(var i = 0; i < array_length(team_target); i++) {
			var c = team_target[i]
			var wea = c.weapon
			var shi = c.shield
			draw_sprite_ext(c.sprite_index, c.image_index, c.x*2, c.y*2, 2, 2, 0, c_white, flashAlpha)
			if wea && wea.image_alpha != 0 {
				draw_sprite_ext(wea.sprite_index, wea.image_index, wea.x*2, wea.y*2, 2, 2, 0, c_white, flashAlpha)
			}
			if shi && shi.image_alpha != 0 {
				draw_sprite_ext(shi.sprite_index, shi.image_index, shi.x*2, shi.y*2, 2, 2, 0, c_white, flashAlpha)
			}
			
		}
	}
	if impact {
		flashAlpha -= 0.05
	}
	shader_reset()
}

if effect_target != false && impact {
	if compte >= sprite_get_number(effect_target) - 1 {
		compte = sprite_get_number(effect_target) - 1
	}
	
	
	
	if effect_target != effect_death {
		for(var i = 0; i < array_length(cible); i++) {
			draw_sprite_ext(effect_target, compte, cible[i].x*2, cible[i].y*2, 2, 2, 0, c_white, 1)
		}
	} else {
		for(var i = 0; i < array_length(cible); i++) {
			if cible[i].status == "KO" {
				draw_sprite_ext(effect_target, compte, cible[i].x*2, cible[i].y*2, 2, 2, 0, c_white, 1)
			}
		}
	}
	
	compte += (1/3)
	
	
}

if effect_lanceur != false && impact {
	if compte >= sprite_get_number(effect_lanceur) - 1 {
		compte = sprite_get_number(effect_lanceur) - 1
	}
	draw_sprite_ext(effect_lanceur, compte, lanceur.x*2, lanceur.y*2, 2, 2, 0, c_white, 1)
	compte += (1/3)
}

if damage_show != false {
	for(var i = 0; i < array_length(cible); i++) {
		draw_set_color(c_white)
		draw_set_font(Font_damage_2)
		text(cible[i].x*2 + 50, cible[i].y*2 - 50, "~"+string(damage[i]))
		draw_set_color(c_black)
		draw_set_font(Font_damage_1)
		text(cible[i].x*2 + 50, cible[i].y*2-2 - 50, "~"+string(damage[i]))
		
		if cible[i].PF {
			var shift = -(sin(t*pi*2/room_speed)*20)
			if shift >= 0 || t >= 30 {
				shift = 0
			}
			
			draw_sprite_ext(Text_fight, 0, cible[i].x*2 + 0, cible[i].y*2-2 - 60 + shift, 3, 3, 0, c_white, 1)
		}
	}
	t ++
}

// Menu Formation

if (menu[menu_i] == "formation" || menu[menu_i] == "formation_c") && !act {
	
	draw_formation()
	
}

// Panneau magie, techniques et objets

if menu[menu_i] == "skills" && !act {
	
	draw_sprite(menu_skills, 0, 190, 25)
	
	var player = global.team[turn]
	
	for (var i = 0; i < array_length(player.skills); ++i;) {
		
		var color = c_white
		var sk = player.skills[i]
		var nom = sk[0]
		var pm = sk[1]
		
		if choice_skill == i {
			color = c_yellow
		} else if player.PM < pm {
			color = c_grey
		}
		
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		draw_text_color(220, 50+30*i, nom, c_black, c_black, c_black, c_black, 1)
		draw_text_color(218, 48+30*i, nom, color, color, color, color, 1)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		draw_text_color(458, 59+30*i, string(pm)+" PM", c_black, c_black, c_black, c_black, 1)
		draw_text_color(456, 57+30*i, string(pm)+" PM", color, color, color, color, 1)
	}
	
	draw_set_halign(fa_left)
	draw_text_color(220, 57+234+2, "PAGE 1 / 1", c_black, c_black, c_black, c_black, 1)
	draw_text(218, 57+234, "PAGE 1 / 1")
	
}

if menu[menu_i] == "objects" && !act {
	
	draw_sprite(menu_skills, 0, 190, 25)
	
	for (var i = 0; i < array_length(global.inventory); ++i;) {
		
		var color = c_white
		var ob = global.inventory[i]
		var name = ob[0]
		var qa = ob[1]
		
		if choice_objets == i {
			color = c_yellow
		}
		
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		draw_text_color(220, 50+30*i, name, c_black, c_black, c_black, c_black, 1)
		draw_text_color(218, 48+30*i, name, color, color, color, color, 1)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		draw_text_color(458, 59+30*i, string(qa), c_black, c_black, c_black, c_black, 1)
		draw_text_color(456, 57+30*i, string(qa), color, color, color, color, 1)
	}
	
	draw_set_halign(fa_left)
	draw_text_color(220, 57+234+2, "PAGE 1 / 1", c_black, c_black, c_black, c_black, 1)
	draw_text(218, 57+234, "PAGE 1 / 1")
	
}