function draw_menu_save(){
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_font(Font_mini)
	draw_set_color(c_white)

	draw_sprite(sprite_main_menu_2, 0, 400, 0)
	text_sha(190, 17, "Sauvegardes")
	
	for (var i = 0; i < 5; i++) {
		var choice = 0
		if choice_options1 == i {
			choice = 1
		}
		draw_sprite(sprite_main_save, choice, 400, 36+i*49)
			
		if struct_options1[i] != -1 {
		
			for (var a = 0; a < array_length(struct_options1[i][2]); a++) {
				draw_sprite(characters_interface, struct_options1[i][2][a], 168+35*a, 60+i*49)
			}
		
			text_sha(165, 74+i*49, struct_options1[i][0])
			draw_set_halign(fa_right)
			text_sha(395, 74+i*49, struct_options1[i][1])
			text_sha(395, 61+i*49, "Niv. moyen : " + string(struct_options1[i][3]))
			draw_set_halign(fa_left)
		} else {
			text_sha(165, 61+i*49, "Aucune donnée", c_grey)
		}
	}
}