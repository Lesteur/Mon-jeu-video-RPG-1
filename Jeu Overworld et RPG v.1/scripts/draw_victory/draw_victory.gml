function draw_victory() {
	draw_set_alpha(0.75)
	var l = defil
	if l > 30 {
		l = 30
	}
	var x_p = 400 + (0.5333*power(l, 2) - 29.333*l)
	draw_rectangle_color(x_p, 41, 450+x_p, 172, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	var t = array_length(global.team)
	for (var i = 0; i < t; i++) {
		var x_p = floor(i/4)*105 + (i mod 4)*13
		var y_p = (i mod 4)*29
		fiche_defil(4 + x_p, 51 + y_p, global.team[i], defil-10*(t-i-1), -1)
	}
	draw_set_font(Font_mini)
	draw_set_valign(fa_bottom)
	draw_set_halign(fa_left)
	draw_text_defil(242, 60, "Résultat de la bataille :", defil)
	draw_text_defil(242, 78, "Tour(s) : " + string(turn_battle), defil-10)
	draw_text_defil(242, 96, "Dégâts subis : " + string(total_damage), defil-20)
	draw_text_defil(242, 114, "Stratégie : " + string(strategy), defil-30)
	draw_text_defil(242, 132, "EXP : " + string(EXP_won), defil-40)
	draw_text_defil(242, 150, "Galas : " + string(galas), defil-50)
	draw_text_defil(242, 168, "Objets : ", defil-60)
	for (var i = 0; i < array_length(loot); i+= 2) {
		draw_sprite_defil(sprite_objects, 280+(i*12), 152, defil-60, 1, loot[i].graphisme_1)
		draw_text_defil(295+(i*12), 168, loot[i+1], defil-60)
	}
	if defil >= 130 {
		var spr_grade = sprite_grade_e
		if grade == "s" {
			spr_grade = sprite_grade_s
		} else if grade == "a" {
			spr_grade = sprite_grade_a
		} else if grade == "b" {
			spr_grade = sprite_grade_b
		} else if grade == "c" {
			spr_grade = sprite_grade_c
		} else if grade == "d" {
			spr_grade = sprite_grade_d
		}
		var sc = defil - 130
		if sc > 30 {
			sc = 30
		}
		draw_sprite_ext(spr_grade, 0, 360, 59, 31-sc, 31-sc, 0, c_white, 1)
	}
}