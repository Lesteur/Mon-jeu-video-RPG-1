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
		var icon = 20
		var color = c_white
		if object.weakness[i][0] != "object" {
			icon = get_icon(object.weakness[i][1])
			switch (object.weakness[i][2]) {
				case "bonus_dmg":
					text1 = "+"+string(object.weakness[i][3]*100) + "%"
					text2 = " subis"
					color = c_yellow
					break
			}
		}
		
		if i < 3 {
			draw_sprite_ext(icons, icon, 414, 168 + i*30, 2, 2, 0, c_white, 1)
			text_sha(448, 172 + i*30, text1, color)
			text_sha(448+string_width(text1), 172 + i*30, text2)
		} else {
			draw_sprite_ext(icons, icon, 614, 168 + (i-3)*30, 2, 2, 0, c_white, 1)
			text_sha(648, 172 + (i-3)*30, text1, color)
			text_sha(648+string_width(text1), 172 + (i-3)*30, text2)
		}
	}
	
	text_sha(414, 266, "Résistances :")
	
	for(var i = 0; i < array_length(object.strength); i++) {
		
		var text1 = ""
		var text2 = ""
		var icon = get_icon(object.strength[i][1])
		var color = c_white
		switch (object.strength[i][2]) {
			case "malus_dmg":
				text1 = "-"+string((1-object.strength[i][3])*100) + "%"
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
			draw_sprite_ext(icons, icon, 414, 298 + i*30, 2, 2, 0, c_white, 1)
			text_sha(448, 302 + i*30, text1, color)
			text_sha(448+string_width(text1), 302 + i*30, text2)
		} else {
			draw_sprite_ext(icons, icon, 614, 298 + (i-3)*30, 2, 2, 0, c_white, 1)
			text_sha(648, 302 + (i-3)*30, text1, color)
			text_sha(648+string_width(text1), 302 + (i-3)*30, text2)
		}
	}
	
	text_sha(414, 256+10+130, "Butin :")
	
	draw_set_font(Font_menu)
	text_sha(438, 418, string(object.gold))
	text_sha(586, 418, string(object.experience))
	
	draw_set_font(Font_mini)
	for(var i = 0; i < array_length(object.booty); i++) {
		//text_sha(414, 450 +i*30, "- Viviherbe (x2)")
		var text = "- " + object.booty[i][0]
		if object.booty[i][1] > 1 {
			text = text + " (x"+ string(object.booty[i][1])+")"
		}
		text_sha(414, 450 +i*30, text)
	}
}