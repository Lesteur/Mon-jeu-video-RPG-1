function draw_exam(object){
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, 400, 280, 0)
	draw_set_alpha(1)
	
	draw_sprite(menu_info_enemy, 0, 400, 280)
	
	draw_set_font(Font_mini)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	
	text_sha(207, 25, call_object(object))
	
	text_sha(207, 40, "PV : "+ string(object.PV) + " / " +string(object.PV_Max))
	
	draw_set_font(Font_menu)
	text_sha(219, 52, string(object.attack))
	text_sha(249, 52, string(object.defense))
	text_sha(279, 52, string(object.magic_attack))
	text_sha(308, 52, string(object.magic_defense))
	text_sha(338, 52, string(object.accuracy))
	text_sha(368, 52, string(object.agility))
	
	draw_set_font(Font_mini)
	
	var array_elem = ["fire", "ice", "thunder", "water", "wind", "earth", "light", "dark", "chaos"]
	var array_elem2 = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	var array_type = ["slash", "pierce", "pounding"]
	var array_type2 = [0, 0, 0]
	var array_alt = ["burn", "freeze", "paralysis", "poison", "crippled", "antimagic", "petrific", "curse"]
	var array_alt2 = [0, 0, 0, 0, 0, 0, 0, 0]
	
	text_sha(207, 67, "Faiblesses / Résistances :")
	
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
			case "+":
				text1 = "+"+string(object.weakness[i][3]*100) + "%"
				color = c_yellow
				break
			case persistent_damage:
				text1 = "Bcp"
				color = c_yellow
				break
			case "malus_dmg":
				text1 = "-"+string(100-round(100/(object.weakness[i][3]+1))) + "%"
				color = c_grey
				break
			case "absorb_dmg":
				text1 = string(object.weakness[i][3]*100) + "%"
				color = c_lime
				break
			case "-":
				text1 = "-"+string(100-object.weakness[i][3]*100) + "%"
				color = c_grey
				break
			default:
				text1 = ""
				color = c_white
		}
		
		var position = research_array(array_elem, object.weakness[i][1])
		if position != noone {
			array_elem2[position][0] = text1
			array_elem2[position][1] = color
		}
		
		var position = research_array(array_type, object.weakness[i][1])
		if position != noone {
			array_type2[position][0] = text1
			array_type2[position][1] = color
		}
		
		var position = research_array(array_alt, object.weakness[i][1])
		if position != noone {
			array_alt2[position][0] = text1
			array_alt2[position][1] = color
		}
	}
	
	for (var i = 0; i < 9; i++) {
		draw_set_alpha(1)
		var x_p = (i mod 3) * 60
		var y_p = floor(i/3) * 15
		if array_elem2[i] != 0 {
			text_sha(224 + x_p, 83 + y_p, array_elem2[i][0], array_elem2[i][1])
		} else {
			draw_set_alpha(0.5)
			draw_rectangle_color(207+x_p - (i mod 3), 70+y_p, 261+x_p - (i mod 3), 82+y_p, c_black, c_black, c_black, c_black, false)
		}
	}
	
	for (var i = 0; i < 3; i++) {
		draw_set_alpha(1)
		var x_p = (i mod 3) * 60
		if array_type2[i] != 0 {
			text_sha(224 + x_p, 131, array_type2[i][0], array_type2[i][1])
		} else {
			draw_set_alpha(0.5)
			draw_rectangle_color(207+x_p - (i mod 3), 118, 261+x_p - (i mod 3), 130, c_black, c_black, c_black, c_black, false)
		}
	}
	
	for (var i = 0; i < 8; i++) {
		draw_set_alpha(1)
		var x_p = (i mod 3) * 60
		var y_p = floor(i/3) * 15
		if array_alt2[i] != 0 {
			text_sha(224 + x_p, 149 + y_p, array_alt2[i][0], array_alt2[i][1])
		} else {
			draw_set_alpha(0.5)
			draw_rectangle_color(207+x_p - (i mod 3), 136+y_p, 261+x_p - (i mod 3), 148+y_p, c_black, c_black, c_black, c_black, false)
		}
	}
	
	draw_set_alpha(1)
	text_sha(207, 198, "Butin :")
	
	draw_set_font(Font_menu)
	text_sha(219, 208, string(object.gold))
	text_sha(293, 208, string(object.experience))
	
	draw_set_font(Font_mini)
	for(var i = 0; i < array_length(object.booty); i+= 2) {
		var text = call_object(object.booty[i])
		var icon = object.booty[i].graphisme_1
		if object.booty[i+1] > 1 {
			text = text + " (x"+ string(object.booty[i+1])+")"
		}
		draw_sprite(menu_skills_2, 0, 207, 210 + (i/2)*18)
		draw_sprite(sprite_objects, icon, 207, 210 + (i/2)*18)
		text_sha(224, 224 +(i/2)*18, text)
	}
}