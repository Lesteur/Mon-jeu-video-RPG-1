function draw_formation(m = 0){
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, 400, 280, 0)
	
	draw_set_alpha(1)
	draw_set_valign(fa_bottom)

	draw_sprite(menu_formation, 0, 0, 0)
	
	draw_set_font(Font_mini)
	
	text_sha(6, 17, "Réserve")
	text_sha(326, 17, "Équipe")
	text_sha(6, 199, "Compétences")
	
	if ally_form != noone {
		var char = team_form[ally_form]
		
		draw_set_font(Font_mini)
		for (var i = 0; i < array_length(char.skills); i++) {
			if i < 4 {
				var d_x = 7
				var d_y = 228+i*17
			} else {
				var d_x = 106
				var d_y = 228+(i-4)*17
			}
			draw_sprite(sprite_skills, char.skills[i].graphisme, d_x, d_y - 17)
			text_sha(d_x + 17, d_y-3, char.skills[i].name)
		}
	}
	
	for (var i = 0; i < array_length(team_form); i++) {
		var char = team_form[i]
		
		if ally_form == i {
			draw_sprite(fiche_formation_light, 0, 266, 26+i*44)
		} else {
			draw_sprite(fiche_formation, 0, 266, 26+i*44)
		}
		
		draw_sprite(menu_formation_cursor, 0, 266, 26+44*choice_form)
		draw_sprite(characters_interface, char.Num, 278, 62+i*44)
		
		draw_set_font(Font_mini)
		
		text_sha(303, 44+i*44, char.name)
		
		var PV_ally = ((char.PV_Max-char.PV)/char.PV_Max)*100
		var PM_ally = ((char.PM_Max-char.PM)/char.PM_Max)*100
		
		draw_set_font(Font_menu)
		
		text_sha(316, 51+44*i, string(char.PV)+"/"+string(char.PV_Max))
		draw_healthbar(316, 49+44*i, 360, 52+44*i, PV_ally, c_black, c_black, c_black, 1, 0, 0)
	
		text_sha(316, 61+44*i, string(char.PM)+"/"+string(char.PM_Max))
		draw_healthbar(316, 59+44*i, 360, 62+44*i, PM_ally, c_black, c_black, c_black, 1, 0, 0)
		
		text_sha(380, 37+i*44, string(char.attack))
		text_sha(380, 46+i*44, string(char.defense))
		text_sha(380, 55+i*44, string(char.magic_attack))
		text_sha(380, 64+i*44, string(char.magic_defense))
	}
	
	if menu[menu_i] == "formation_c" && m == 0 {
		draw_set_font(Font_mini)
		draw_set_color(c_black)
		draw_sprite(menu_formation_c, 0, 200, 140)
		draw_text_special("La formation ne pourra plus être #changée pour les trois prochains #tours. Continuer ?", 109, 132, 182, 15)
	}
}