function draw_formation(){
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, 800, 560, 0)
	
	draw_set_alpha(1)
	draw_set_valign(fa_bottom)

	draw_sprite(menu_formation, 0, 0, 0)
	
	draw_set_font(Font_mini)
	draw_set_color(c_black)
	draw_text(15, 39, "Réserve")
	draw_set_color(c_white)
	draw_text(12, 36, "Réserve")
	
	draw_set_color(c_black)
	draw_text(655, 39, "Equipe")
	draw_set_color(c_white)
	draw_text(652, 36, "Equipe")
	
	draw_set_color(c_black)
	draw_text(15, 403, "Compétences")
	draw_set_color(c_white)
	draw_text(12, 400, "Compétences")
	
	if form_ally != "none" {
		var char = global.team[form_ally]
		draw_set_font(Font_menu)
		draw_set_color(c_black)
		draw_text(16, 426, "PAGE 1 / 1")
		draw_set_color(c_white)
		draw_text(14, 424, "PAGE 1 / 1")
		
		draw_set_font(Font_mini)
		for (var i = 0; i<array_length(char.skills); i++) {
			if i < 4 {
				var d_x = 14
				var d_y = 464+i*30
			} else {
				var d_x = 212
				var d_y = 464+(i-4)*30
			}
			draw_text(d_x, d_y, char.skills[i][0])
		}
	}
	
	for (var i = 0; i < array_length(global.team); i++) {
		var char = global.team[i]
		
		draw_sprite(fiche_formation, char.Num, 532, 52+i*88)
		
		if form_ally == i {
			draw_sprite(fiche_formation_light, char.Num, 532, 52+i*88)
		}
		
		draw_set_font(Font_mini)
		draw_set_color(c_black)
		draw_text(611, 91+i*88, char.Nom)
		draw_set_color(c_white)
		draw_text(608, 88+i*88, char.Nom)
		
		var PV_ally = ((char.PV_Max-char.PV)/char.PV_Max)*100
		var PM_ally = ((char.PM_Max-char.PM)/char.PM_Max)*100
		
		draw_set_font(Font_menu)
		
		draw_text(632, 102+88*i, string(char.PV)+"/"+string(char.PV_Max))
		draw_healthbar(632, 98+88*i, 721, 105+88*i, PV_ally, c_black, c_black, c_black, 1, 0, 0)
	
		draw_text(632, 123+87*i, string(char.PM)+"/"+string(char.PM_Max))
		draw_healthbar(632, 118+88*i, 721, 125+88*i, PM_ally, c_black, c_black, c_black, 1, 0, 0)
		
		draw_text(760, 74+i*88, string(char.Attaque))
		draw_text(760, 92+i*88, string(char.Defense))
		draw_text(760, 110+i*88, string(char.Attaque_magique))
		draw_text(760, 128+i*88, string(char.Defense_magique))
	}
	
	draw_sprite_ext(pointeur, 0, 500, 92+88*form_choice, 2, 2, 0, c_white, 1)
	
	if menu[menu_i] == "formation_c" {
		draw_set_font(Font)
		draw_sprite(menu_formation_c, 0, 400, 280)
		draw_set_color(c_black)
		draw_text_ext(229, 354, "La formation ne sera plus changée pour 2 tours. Confirmer ?", 45, 348)
		draw_set_color(c_white)
		draw_text_ext(226, 351, "La formation ne sera plus changée pour 2 tours. Confirmer ?", 45, 348)
	}

}