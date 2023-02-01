// Ajustement du texte

global.t ++
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

for (var i = 0; i < array_length(global.team); ++i;) {
	var m_effect = menu_effect
	if i != turn {
		m_effect = 0
	}
	
	if global.team[i].classe == "Mage" {
		draw_sprite_ext(menu_2, choice, 100*i, 221, 0.5, 0.5, 0, c_white, 1)
	} else {
		draw_sprite_ext(menu_1, choice, 100*i, 221, 0.5, 0.5, 0, c_white, 1)
	}
	
	draw_sprite(fiche_stats_fight, 0, i*100, 221-m_effect)
	draw_sprite(characters_interface, global.team[i].Num, i*100 + 12, 218-m_effect)
	
	text_sha(50+100*i, 206-m_effect, string(global.team[i].PV)+"/"+string(global.team[i].PV_Max))
	draw_healthbar(50+100*i, 204-m_effect, 94+100*i, 207-m_effect, PV_allies[i], c_black, c_black, c_black, 1, 0, 0)
	
	text_sha(50+100*i, 216-m_effect, string(global.team[i].PM)+"/"+string(global.team[i].PM_Max))
	draw_healthbar(50+100*i, 214-m_effect, 94+100*i, 217-m_effect, PM_allies[i], c_black, c_black, c_black, 1, 0, 0)
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
		draw_sprite(monitor_target, 0, 400, 0)
	} else if all_target && array_length(team_target) > 1 {
		draw_sprite(monitor_target, 1, 400, 0)
	}
	
	if all_target == false || all_target == noone {
		if team_target == team_enemy_a {
			draw_healthbar(135, 237, 205, 242, PV_enemies[target], c_red, c_green, c_green, 0, 1, 1)
		}
	}
	
	if team_target == team_a {
		var scale = -1
		var pos_x = 30
	} else {
		var scale = 1
		var pos_x = -30
	}
	
	if all_target == false || all_target == noone {
		draw_sprite_ext(cursor, cursor_i, team_target[target].x+pos_x, team_target[target].y, scale, 1, 0, c_white, 1)
	} else {
		for (var i = 0; i < array_length(team_target); i++) {
			draw_sprite_ext(cursor, cursor_i, team_target[i].x+pos_x, team_target[i].y, scale, 1, 0, c_white, 1)
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
			draw_set_halign(fa_right)
			text_sha(team_target[i].x+pos_x, team_target[i].y + 15, string(round(prec*100))+"%")
			draw_sprite_ext(sprite_precision, 0, team_target[i].x+pos_x + 1, team_target[i].y + 15, 1, 1, 0, c_white, 1)
		}
	} else if (precision != noone) {
		var acc_boost = global.boost_num[? string(player.boost[? "accuracy"][0])]
		var agi_boost = global.boost_num[? string(team_target[target].boost[? "agility"][0])]
		var prec =  precision * (player.accuracy*acc_boost) / (team_target[target].agility*agi_boost)
		if precision == 0 || prec > 1 {
			prec = 1
		}
		draw_set_halign(fa_right)
		text_sha(team_target[target].x+pos_x, team_target[target].y + 15, string(round(prec*100))+"%")
		draw_sprite_ext(sprite_precision, 0, team_target[target].x+pos_x + 1, team_target[target].y + 15, 1, 1, 0, c_white, 1)
	}
	
}

// Affichage du tour

draw_set_valign(fa_bottom)
draw_set_halign(fa_left)
draw_set_font(Font_mini)
draw_set_color(c_black)

if message_quick != false && message_quick_t > 0 {
	draw_text_special(message_quick, 11, 246, 378, 15)
	message_quick_t --
} else {
	draw_text_special(message_monitor, 11, 246, 378, 15)
}

draw_set_valign(fa_top)
draw_set_color(c_white)

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
		draw_sprite_ext(c.sprite_index, c.image_index, c.x, c.y, 1, 1, 0, c_white, flashAlpha)
	} else if all_target == true {
		for (var i = 0; i < array_length(team_target); i++) {
			c = team_target[i]
			draw_sprite_ext(c.sprite_index, c.image_index, c.x, c.y, 1, 1, 0, c_white, flashAlpha)
		}
	}
	flashAlpha -= 0.05
	shader_reset()
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
			shift = -1.5*(t-40)
		}
		
		var tx = string(damage[i])
		tx = string_lettersdigits(tx)
		
		if is_numeric(damage[i]) {
			for (var c = 1; c <= string_length(tx); c++) {
				var char = string_char_at(tx, c)
				draw_sprite_ext(Number_fight, real(char), cible[i].x+(c-1)*12 + 15, cible[i].y - 20 + shift, 1.5, 1.5, 0, color, alpha)
			}
		} else {
			draw_sprite_ext(Text_fight, 3, cible[i].x + 15, cible[i].y - 20 + shift, 1.5, 1.5, 0, color, alpha)
		}
		
	}
	t ++
}

// Menu Formation

if (menu[menu_i] == "formation" || menu[menu_i] == "formation_c") && !act {
	draw_formation()
}

if menu[menu_i] == "exam" {
	draw_sprite_ext(cursor, cursor_i, team_enemy_a[choice_exam].x-30, team_enemy_a[choice_exam].y, 1, 1, 0, c_white, 1)
}

if menu[menu_i] == "exam_enemy" {
	draw_exam(team_enemy_a[choice_exam])
}

// Panneau magie, techniques et objets

if menu[menu_i] == "skills" && !act {
	
	draw_sprite(menu_skills_1, 0, 110, 12)
	
	var player = global.team[turn]
	
	var len = array_length(player.skills)
	var l = n-1
	var pages = ceil(len/n)-1
	if choice_skill_page == pages && len mod n != 0 {
		l = (len mod n) - 1
	}
	var m = n*choice_skill_page
	
	for (var i = 0; i <= l; ++i) {
		
		var color = c_white
		var sk = player.skills[i + m]
		var name = sk.name
		var pm = sk.PM
		var sp = sk.graphisme
		
		draw_sprite(menu_skills_2, 0, 118, 20 + i*17)
		
		if choice_skill == i {
			color = c_yellow
		} else if player.PM < pm {
			color = c_grey
		}
		
		draw_set_valign(fa_top)
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		text_sha(135, 20+17*i, name, color)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		text_sha(254, 25+17*i, string(pm)+" PM", color)
		
		draw_sprite(sprite_skills, sp, 118, 20 + i*17)
	}
	
	draw_set_halign(fa_left)
	text_sha(118, 155, "PAGE " + string(choice_skill_page+1) + " / " + string(pages+1))
}

if menu[menu_i] == "objects" && !act {
	
	draw_sprite(menu_skills_1, 0, 110, 12)
	var len = array_length(global.inventory)
	var l = (n-1)*2
	var pages = ceil(len/(n*2)) - 1
	if choice_objets_page == pages && len mod (n*2) != 0 {
		l = (len mod (n*2)) - 2
	}
	var m = n*choice_objets_page*2
	
	for (var i = 0; i <= l; i += 2) {
		
		var color = c_white
		var ob = global.inventory[i + m]
		var name = ob.name
		var qa = global.inventory[i+1 + m]
		var sp = ob.graphisme_1
		
		draw_sprite(menu_skills_2, 0, 118, 20 + (i/2)*17)
		
		if choice_objets == i {
			color = c_yellow
		}
		
		draw_set_valign(fa_top)
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		text_sha(135, 20+17*(i/2), call_object(ob), color)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		text_sha(254, 25+17*(i/2), string(qa), color)
		
		draw_sprite(sprite_objects, sp, 118, 20 + (i/2)*17)
	}
	
	draw_set_halign(fa_left)
	text_sha(118, 155, "PAGE " + string(choice_objets_page+1) + " / " + string(pages+1))
}

if issue_battle == 1 && act {
	draw_victory()
}