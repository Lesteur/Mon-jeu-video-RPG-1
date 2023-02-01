function draw_menu_inventory() {
	// Draw de l'interface et des vie des persos

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	draw_set_font(Font_mini)
	draw_set_color(c_white)
	
	draw_sprite(sprite_main_menu_2, 0, 400, 0)
	text_sha(190, 17, "Inventaire")
	
	draw_sprite(sprite_inventory_menu, 0, 400, 50)
	
	var storage = variable_global_get("inventory")
	
	var len = array_length(storage)
	var l = (n-1)*2
	var pages = ceil(len/(n*2)) - 1
	if choice_objets_page == pages && len mod (n*2) != 0 {
		l = (len mod (n*2)) - 2
	}
	var m = n*choice_objets_page*2
	
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 155, 400, 200, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	draw_text_special(storage[choice_objets + m].description_1, 11, 170, 378, 15)
	draw_set_color(c_white)
	draw_set_valign(fa_top)
	
	var list = ["Utiliser", "Jeter", "Mélanger", "Recettes", "Trier"]
	for (var i = 0; i < 5; i ++) {
		if choice_options1 == i {
			color = c_yellow
		} else {
			color = c_white
		}
		text_sha(15, 58 + 17*i, list[i], color)
	}
	
	for (var i = 0; i <= l; i += 2) {
		
		var color = c_white
		var ob = storage[i + m]
		var qa = storage[i+1 + m]
		var sp = ob.graphisme_1
		
		var x_p = floor(i/n) * 142
		
		if i < n {
			var y_p = (i/2)*17
		} else {
			var y_p = ((i-n)/2)*17
		}
		
		draw_sprite(menu_skills_2, 0, 112 + x_p, 58 + y_p)
		
		if choice_objets == i && (submenu[submenu_i] == "choice_inventory" || submenu[submenu_i] == "use_objects") {
			color = c_yellow
		}
		
		draw_set_font(Font_mini)
		draw_set_halign(fa_left)
		text_sha(129 + x_p, 58 + y_p, call_object(ob), color)
		draw_set_font(Font_menu)
		draw_set_halign(fa_right)
		text_sha(248 + x_p, 63 + y_p, string(qa), color)
		
		draw_sprite(sprite_objects, sp, 112 + x_p, 58 + y_p)
	}
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	text_sha(112, 150, "PAGE " + string(choice_objets_page+1) + " / " + string(pages+1))
	
	draw_set_font(Font_menu)
	for (var i = 0; i < array_length(global.team_v); ++i) {
	
		var player = global.team_v[i]
		var PV_ally = ((player.PV_Max-player.PV)/player.PV_Max)*100
		var PM_ally = ((player.PM_Max-player.PM)/player.PM_Max)*100
	
		var choice = 0
		if submenu[submenu_i] == "use_objects" && choice_options3 == i {
			choice = 1
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

}