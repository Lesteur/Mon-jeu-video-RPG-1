function draw_exam(object){
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), 0)
	draw_set_alpha(1)
	
	draw_sprite_ext(menu_info_enemy, 0, 800, 560, 2, 2, 0, c_white, 1)
	
	draw_set_font(Font_mini)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	
	text_sha(414, 52, object.name)
	
	text_sha(414, 82, "PV : "+ string(object.PV) + " / " +string(object.PV_Max))
	
	draw_set_font(Font_menu)
	text_sha(438, 104, string(object.attack))
	text_sha(498, 104, string(object.defense))
	text_sha(558, 104, string(object.magic_attack))
	text_sha(616, 104, string(object.magic_defense))
	text_sha(676, 104, string(object.accuracy))
	text_sha(736, 104, string(object.agility))
	
	draw_set_font(Font_mini)
	
	text_sha(414, 136, "Faiblesses :")
	
	for(var i = 0; i < array_length(object.weakness); i++) {
		
		var text1 = string(object.weakness[i][1])
		var text2 = ""
		var color = c_white
		if object.weakness[i][0] != "object" {
			var icon = get_icon(object.weakness[i][1])
			var spr = icons
		} else {
			var icon = variable_global_get(object.weakness[i][1]).graphisme_1
			var spr = sprite_objects
		}
		switch (object.weakness[i][2]) {
			case "bonus_dmg":
				text1 = "+"+string(object.weakness[i][3]*100) + "%"
				text2 = " subis"
				color = c_yellow
				break
			case persistent_damage:
				text1 = "Bcp"
				text2 = " de dégâts"
				color = c_yellow
				break
		}
		
		if i < 3 {
			var x_p = 0
			var a = 0
		} else {
			var x_p = 200
			var a = 3
		}
		
		draw_sprite_ext(spr, icon, 414 + x_p, 142 + (i-a)*30, 2, 2, 0, c_white, 1)
		text_sha(448 + x_p, 172 + (i-a)*30, text1, color)
		text_sha(448 + x_p + string_width(text1), 172 + (i-a)*30, text2)
	}
	
	text_sha(414, 266, "Résistances :")
	
	for(var i = 0; i < array_length(object.strength); i++) {
		
		var text1 = ""
		var text2 = ""
		var icon = get_icon(object.strength[i][1])
		var color = c_white
		switch (object.strength[i][2]) {
			case "malus_dmg":
				text1 = "-"+string(100-round(100/(object.strength[i][3]+1))) + "%"
				text2 = " subis"
				color = c_grey
				break
			case "absorb_dmg":
				text1 = "+"+string(object.strength[i][3]*100) + "%"
				text2 = " absorbés"
				color = c_lime
				break
		}
		
		if i < 3 {
			var x_p = 0
			var a = 0
		} else {
			var x_p = 200
			var a = 3
		}
		
		draw_sprite_ext(icons, icon, 414 + x_p, 272 + (i-a)*30, 2, 2, 0, c_white, 1)
		text_sha(448 + x_p, 302 + (i-a)*30, text1, color)
		text_sha(448 + x_p + string_width(text1), 302 + (i-a)*30, text2)
		
		
	}
	
	text_sha(414, 256+10+130, "Butin :")
	
	draw_set_font(Font_menu)
	text_sha(438, 418, string(object.gold))
	text_sha(586, 418, string(object.experience))
	
	draw_set_font(Font_mini)
	for(var i = 0; i < array_length(object.booty); i+= 2) {
		var text = object.booty[i].name
		var icon = object.booty[i].graphisme_1
		if object.booty[i+1] > 1 {
			text = text + " (x"+ string(object.booty[i+1])+")"
		}
		draw_sprite(menu_skills_2, 0, 414, 420 + (i/2)*34)
		draw_sprite_ext(sprite_objects, icon, 414, 420 + (i/2)*34, 2, 2, 0, c_white, 1)
		text_sha(448, 450 +(i/2)*34, text)
	}
}