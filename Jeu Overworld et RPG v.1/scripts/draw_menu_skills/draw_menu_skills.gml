function draw_menu_skills() {
	// Draw de l'interface et des vie des persos

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_font(Font_mini)
	draw_set_color(c_white)

	draw_sprite(sprite_main_menu_2, 0, 400, 0)
	text_sha(190, 17, "Compétences")
	
	var color = c_white
	draw_set_valign(fa_top)
	if submenu_i >= 1 {
		draw_sprite(sprite_inventory_menu, 0, 400, 50)
		var list = ["Voir", "Utiliser", "Comp. utilisables", "Comp. passives", "Réinitialiser"]
		for (var i = 0; i < 5; i ++) {
			if choice_options2 == i {
				color = c_yellow
			} else {
				color = c_white
			}
			text_sha(15, 58 + 17*i, list[i], color)
		}
		
		if submenu[submenu_i] == "see_skills" || submenu[submenu_i] == "use_skills" {
			
			if submenu[submenu_i] == "see_skills" {
				var storage = struct_options2.skills
			} else {
				var storage = struct_options1
			}
			var len = array_length(storage)
			var l = n-1
			var pages = ceil(len/n) - 1
			if choice_objets_page == pages && len mod n != 0 {
				l = (len mod n) - 1
			}
			var m = n*choice_objets_page
			
			draw_text(20, 20, string(choice_objets))
			
			for (var i = 0; i <= l; i ++) {
		
				var color = c_white
				var ob = storage[i + m]
				var sp = ob.graphisme
		
				var x_p = floor(i/(n/2)) * 142
		
				if i < n/2 {
					var y_p = i*17
				} else {
					var y_p = (i-n/2)*17
				}
		
				draw_sprite(menu_skills_2, 0, 112 + x_p, 58 + y_p)
		
				if choice_objets == i && (submenu[submenu_i] == "see_skills" || submenu[submenu_i] == "use_skills") {
					color = c_yellow
				}
		
				draw_set_font(Font_mini)
				draw_set_halign(fa_left)
				text_sha(129 + x_p, 58 + y_p, ob.name, color)
				draw_set_font(Font_menu)
				draw_set_halign(fa_right)
				text_sha(248 + x_p, 63 + y_p, string(ob.PM) + " PM", color)
		
				draw_sprite(sprite_skills, sp, 112 + x_p, 58 + y_p)
			}
	
		draw_set_halign(fa_left)
		draw_set_valign(fa_bottom)
		text_sha(112, 150, "PAGE " + string(choice_objets_page+1) + " / " + string(pages+1))
		
		}
		
	}

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_font(Font_menu)
	for (var i = 0; i < array_length(global.team_v); ++i) {
	
		var player = global.team_v[i]
		var PV_ally = ((player.PV_Max-player.PV)/player.PV_Max)*100
		var PM_ally = ((player.PM_Max-player.PM)/player.PM_Max)*100
		
		if (choice_options1 == i && submenu[submenu_i] == "select_characters") || (choice_options4 == i && submenu[submenu_i] == "use_skills_char") {
			var choice = 1
		} else {
			var choice = 0
		}
		
		draw_sprite(fiche_stats_menu, choice, i*100, 280)
		draw_sprite(characters_interface, player.Num, i*100+12, 265)
	
		text_sha(50+100*i, 251, string(player.PV)+"/"+string(player.PV_Max))
		draw_healthbar(50+100*i, 249, 94+100*i, 252, PV_ally, c_black, c_black, c_black, 1, 0, 0)
	
		text_sha(50+100*i, 261, string(player.PM)+"/"+string(player.PM_Max))
		draw_healthbar(50+100*i, 259, 94+100*i, 262, PM_ally, c_black, c_black, c_black, 1, 0, 0)
	
		var seuil = courbe_exp(player.Niveau+1) - courbe_exp(player.Niveau)
		draw_healthbar(23+100*i, 269, 94+100*i, 272, 100*(player.EXP_restant/seuil), c_black, c_black, c_black, 1, 0, 0)
	
		text_sha(50+100*i, 241, "Niveau "+string(player.Niveau))
	}
	
	text_sha(200, 100, mess)

}