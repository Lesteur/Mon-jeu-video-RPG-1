function draw_menu_main() {
	// Draw de l'interface et des vie des persos

	var menu_names = ["Inventaire", "Équipe", "Équipement", "Compétences", "Sauvegarder", "Collections"]

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_font(Font_mini)
	draw_set_color(c_white)

	draw_sprite(sprite_main_menu_2, 0, 400, 0)
	text_sha(190, 17, "Forêt du Tutoriel")

	for (var i = 0; i < 6; ++i) {
		if choice_menu_main == i {
			draw_sprite(sprite_main_menu_1, i, 15, 24+33*i)
			text_sha(49, 46+33*i, menu_names[i])
		} else {
			draw_sprite(sprite_main_menu_1, i, 0, 24+33*i)
			text_sha(34, 46+33*i, menu_names[i])
		}
	}

	draw_set_font(Font_menu)
	for (var i = 0; i < array_length(global.team_v); ++i) {
	
		var player = global.team_v[i]
		var PV_ally = ((player.PV_Max-player.PV)/player.PV_Max)*100
		var PM_ally = ((player.PM_Max-player.PM)/player.PM_Max)*100
	
		draw_sprite(fiche_stats_menu, 0, i*100, 280)
		draw_sprite(characters_interface, player.Num, i*100+12, 265)
	
		text_sha(50+100*i, 251, string(player.PV)+"/"+string(player.PV_Max))
		draw_healthbar(50+100*i, 249, 94+100*i, 252, PV_ally, c_black, c_black, c_black, 1, 0, 0)
	
		text_sha(50+100*i, 261, string(player.PM)+"/"+string(player.PM_Max))
		draw_healthbar(50+100*i, 259, 94+100*i, 262, PM_ally, c_black, c_black, c_black, 1, 0, 0)
	
		var seuil = courbe_exp(player.Niveau+1) - courbe_exp(player.Niveau)
		draw_healthbar(23+100*i, 269, 94+100*i, 272, 100*(player.EXP_restant/seuil), c_black, c_black, c_black, 1, 0, 0)
	
		text_sha(50+100*i, 241, "Niveau "+string(player.Niveau))
	}
	
	text_sha(160, 150, mess)

}