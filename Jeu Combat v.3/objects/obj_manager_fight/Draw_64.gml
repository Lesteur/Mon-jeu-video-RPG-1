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
	
	if global.team[i].classe == "Mage" {
		draw_sprite(menu_2, choice, 200*i, 442)
	} else {
		draw_sprite(menu_1, choice, 200*i, 442)
	}
	
	draw_sprite(fiche_stats_fight, global.team[i].Num, i*200, 442-m_effect)
	
	draw_text(101+200*i, 412-m_effect, string(global.team[i].PV)+"/"+string(global.team[i].PV_Max))
	draw_healthbar(100+200*i, 408-m_effect, 189+200*i, 415-m_effect, PV_allies[i], c_black, c_black, c_black, 1, 0, 0)
	
	draw_text(101+200*i, 432-m_effect, string(global.team[i].PM)+"/"+string(global.team[i].PM_Max))
	draw_healthbar(100+200*i, 428-m_effect, 189+200*i, 435-m_effect, PM_allies[i], c_black, c_black, c_black, 1, 0, 0)
}

if ((menu[menu_i] == "target") || (menu[menu_i] == "skills_target") || (menu[menu_i] == "objects_target")) && !act {
	
	var player = global.team[turn]
	if menu[menu_i] == "target" {
		var precision = player.Basic_attack.precision
	} else if menu[menu_i] == "skills_target" {
		var precision = player.skills[choice_skill].precision
	} else {
		var precision = noone
	}
	
	if all_target == false && array_length(team_target) > 1 {
		draw_sprite(monitor_target, 0, 800, 0)
	} else if all_target && array_length(team_target) > 1 {
		draw_sprite(monitor_target, 1, 800, 0)
	}
	
	if all_target == false || all_target == noone {
		if team_target == team_enemy_a {
			draw_healthbar(230, 470, 230+180, 470+10,PV_enemies[target], c_red, c_green, c_green, 0, 1, 0)
		}
	}
	
	if team_target == team_a {
		var scale = -2
		var pos_x = 60
	} else {
		var scale = 2
		var pos_x = -60
	}
	
	if all_target == false || all_target == noone {
		draw_sprite_ext(cursor, cursor_i, team_target[target].x*2+pos_x, team_target[target].y*2, scale, 2, 0, c_white, 1)
	} else {
		for (var i = 0; i < array_length(team_target); i++) {
			draw_sprite_ext(cursor, cursor_i, team_target[i].x*2+pos_x, team_target[i].y*2, scale, 2, 0, c_white, 1)
		}
	}
	
	if (precision != noone) && all_target == true {
		var acc_boost = global.boost_num[? string(player.boost[? "accuracy"][0])]
		for (var i = 0; i < array_length(team_target); i++) {
			var agi_boost = global.boost_num[? string(team_target[i].boost[? "agility"][0])]
			var prec =  precision * (player.accuracy*acc_boost) / (team_target[i].agility*agi_boost)
			if precision == 0 || prec > 1 {
				prec = 1
			}
			text_sha(team_target[i].x*2+pos_x, team_target[i].y*2 + 30, string(round(prec*100))+"%")
		}
	} else if (precision != noone) {
		var acc_boost = global.boost_num[? string(player.boost[? "accuracy"][0])]
		var agi_boost = global.boost_num[? string(team_target[target].boost[? "agility"][0])]
		var prec =  precision * (player.accuracy*acc_boost) / (team_target[target].agility*agi_boost)
		if precision == 0 || prec > 1 {
			prec = 1
		}
		draw_set_halign(fa_right)
		text_sha(team_target[target].x*2+pos_x, team_target[target].y*2 + 30, string(round(prec*100))+"%")
		draw_sprite_ext(sprite_precision, 0, team_target[target].x*2+pos_x + 2, team_target[target].y*2 + 30, 2, 2, 0, c_white, 1)
	}
	
}

// Affichage du tour

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(Font_mini)

if message_quick != false && message_quick_t > 0 {
	draw_text_ext(30, 465, string_hash_to_newline(message_quick), 30, 740)
	message_quick_t --
} else {
	draw_text_ext(30, 465, string_hash_to_newline(message_monitor), 30, 740)
}

// Affichage des effets et des dégâts

if target < array_length(team_target) {
	var c = team_target[target]
}

if impact {
	var c = []
	c = cible[0]
}

if (flashAlpha > 0) && c.status != "KO" && impact {
	shader_set(shader_flash)
	if all_target == false || all_target == noone {
		draw_sprite_ext(c.sprite_index, c.image_index, c.x*2, c.y*2, 2, 2, 0, c_white, flashAlpha)
	} else if all_target == true {
		for (var i = 0; i < array_length(team_target); i++) {
			c = team_target[i]
			draw_sprite_ext(c.sprite_index, c.image_index, c.x*2, c.y*2, 2, 2, 0, c_white, flashAlpha)
		}
	}
	flashAlpha -= 0.05
	shader_reset()
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
		
		var color = color_attack[i]
		var alpha = 1
		
		var shift = -(sin(t*pi*2/room_speed)*20)
		if shift >= 0 || t >= 30 {
			shift = 0
		}
		
		if t > 40 {
			alpha = 1 - (t-40)*0.08
			shift = -3*(t-40)
		}
		
		var tx = string(damage[i])
		tx = string_lettersdigits(tx)
		
		if is_numeric(damage[i]) {
			for (var c = 1; c <= string_length(tx); c++) {
				var char = string_char_at(tx, c)
				draw_sprite_ext(Number_fight, real(char), cible[i].x*2+(c-1)*24 + 30, cible[i].y*2 - 40 + shift, 3, 3, 0, color, alpha)
			}
		} else {
			draw_sprite_ext(Text_fight, 3, cible[i].x*2 + 30, cible[i].y*2 - 40 + shift, 3, 3, 0, color, alpha)
		}
		
		if cible[i].PF {
			draw_sprite_ext(Text_fight, 0, cible[i].x*2 + 30, cible[i].y*2 + shift, 3, 3, 0, color, alpha)
		}
	}
	t ++
}

// Menu Formation

if (menu[menu_i] == "formation" || menu[menu_i] == "formation_c") && !act {
	draw_formation()
}

if menu[menu_i] == "exam" {
	draw_sprite_ext(cursor, cursor_i, team_enemy_a[choice_exam].x*2-60, team_enemy_a[choice_exam].y*2, 2, 2, 0, c_white, 1)
}

if menu[menu_i] == "exam_enemy" {
	draw_exam(team_enemy_a[choice_exam])
}

// Panneau magie, techniques et objets

if menu[menu_i] == "skills" && !act {
	
	draw_sprite(menu_skills_1, 0, 220, 24)
	
	var player = global.team[turn]
	
	for (var i = 0; i < array_length(player.skills); ++i;) {
		
		var color = c_white
		var sk = player.skills[i]
		var name = sk.name
		var pm = sk.PM
		var sp = sk.graphisme
		
		draw_sprite(menu_skills_2, 0, 236, 40 + i*34)
		
		if choice_skill == i {
			color = c_yellow
		} else if player.PM < pm {
			color = c_grey
		}
		
		draw_set_valign(fa_top)
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		text_sha(270, 41+34*i, name, color)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		text_sha(508, 50+34*i, string(pm)+" PM", color)
		
		draw_sprite_ext(sprite_skills, sp, 236, 40 + i*34, 2, 2, 0, c_white, 1)
	}
	
	draw_set_halign(fa_left)
	text_sha(236, 310, "PAGE 1 / 1")
}

if menu[menu_i] == "objects" && !act {
	
	draw_sprite(menu_skills_1, 0, 220, 24)
	
	for (var i = 0; i < array_length(global.inventory); i += 2;) {
		
		var color = c_white
		var ob = global.inventory[i]
		var name = ob.name
		var qa = global.inventory[i+1]
		var sp = ob.graphisme_1
		
		draw_sprite(menu_skills_2, 0, 236, 40 + (i/2)*34)
		
		if choice_objets == i {
			color = c_yellow
		}
		
		draw_set_valign(fa_top)
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		text_sha(270, 41+34*(i/2), name, color)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		text_sha(508, 50+34*(i/2), string(qa), color)
		
		draw_sprite_ext(sprite_objects, sp, 236, 40 + (i/2)*34, 2, 2, 0, c_white, 1)
	}
	
	draw_set_halign(fa_left)
	text_sha(236, 310, "PAGE 1 / 1")
}