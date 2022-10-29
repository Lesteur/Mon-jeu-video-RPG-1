function select_charac(team) {
	
	if target >= array_length(team) {
		target = 0
	}
	
	if keyboard_check_pressed(vk_up) && array_length(team) > 1 {
		target --
		if target < 0 {
			target = array_length(team) - 1
		}
		
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(vk_down) && array_length(team) > 1 {
		target ++
		if target >= array_length(team) {
			target = 0
		}
		
		audio_play_sound(snd_movemenu, 5, false)
	}
}

function select_choice(variable, number, direction, jump = 1) {
	
	if direction {
		var dir_1 = vk_left
		var dir_2 = vk_right
	} else {
		var dir_1 = vk_up
		var dir_2 = vk_down
	}
	
	if keyboard_check_pressed(dir_1) && number > 0 {
		variable -= jump
		if variable < 0 {
			variable = number
		}
		audio_play_sound(snd_movemenu, 5, false)
	} else if keyboard_check_pressed(dir_2) && number > 0 {
		variable += jump
		if variable > number {
			variable = 0
		}
		audio_play_sound(snd_movemenu, 5, false)
	}
	
	return variable
	
}

function text_sha(x, y, str, color = c_white) {
	draw_set_color(c_black)
	draw_text(x+1, y+1, str)
	draw_set_color(color)
	draw_text(x, y, str)
}

function draw_sprite_defil(sprite, x, y, defilement = 30, orient = 1, subimg = 0){
	var x_c = orient*(400) + x
	var l = defilement
	if l > 30 {
		l = 30
	}
	draw_sprite(sprite, subimg, x_c + orient*(0.5333*power(l, 2) - 29.333*l), y)
}
	
function draw_text_defil(x, y, str, defilement = 30 , color = c_white, orient = 1){
	var x_c = orient*(400) + x
	var l = defilement
	if l > 30 {
		l = 30
	}
	text_sha(x_c + orient*(0.5333*power(l, 2) - 29.333*l), y, str, color)
}
	
function draw_text_defil2(x, y, str, defilement = 30, color = c_white, orient = 1){
	var length = string_length(str)
	var x_c = x
	var l = defilement
	for (var i = 1; i <= length; i++) {
		var char = string_char_at(str, i)
		draw_text_defil(x_c, y, char, l, color, orient)
		l -= 5
		x_c += string_width(char)
	}
}
	
function fiche_defil(x, y, player, defilement = 30, orient = 1) {
	var l = defilement
	if l > 30 {
		l = 30
	}
	var c = orient*(400 + 0.5333*power(l, 2) - 29.333*l)
	draw_set_valign(fa_bottom)
	draw_set_halign(fa_right)
	draw_sprite(fiche_exp, player.Num, x+c, y)
	draw_set_font(Font_menu)
	text_sha(x+96+c, y+15, "Niv. " + string(player.Niveau))
	var seuil = courbe_exp(player.Niveau+1) - courbe_exp(player.Niveau)
	draw_healthbar(23+x+c, 16+y, 94+x+c, 19+y, 100*(player.EXP_restant/seuil), c_black, c_black, c_black, 1, 0, 0)
	draw_set_alpha(1)
	if player.cc > 0 {
		draw_set_alpha(player.cc)
		draw_rectangle_color(x, y, x+99,y+24, c_white, c_white, c_white, c_white, false)
		draw_sprite(Text_fight, 4, x + 2, y - (5-5*player.cc))
		player.cc -= 0.05
	}
	draw_set_alpha(1)
}

function research_array(array, element, increm = 1) {
	for (var i = 0; i < array_length(array); i+=increm) {
		if array[i] == element {
			return i
		}
	}
	return noone
}

function research_array_3d(array, array_elements, increm = 1) {
	var array_find = []
	for (var b = 0; b < array_length(array_elements); b++) {
		var a = research_array(array, array_elements[b], increm)
		if a != noone {
			array_insert(array_find, array_length(array_find), a)
		}
	}
	return array_find
}

function courbe_exp(n) {
	return power(n, 3)*10
}

function courbe_stat(a, b, c, x) {
	return (a*power(x, 2) + b*x + c)
}

function def_exp(player, sound = false){
	if player.EXP_won > 100000 {
		var tranche = 1000
	} else if player.EXP_won > 10000 {
		var tranche = 1
	} else {
		var tranche = 1
	}
	if tranche > player.EXP_won {
		tranche = player.EXP_won
	}
	if tranche > player.EXP_restant {
		tranche = player.EXP_restant
	}
	player.EXP += tranche
	player.EXP_restant -= tranche
	player.EXP_won -= tranche
	if player.EXP_restant == 0 {
		if sound {
			audio_play_sound(snd_level_up, 1, false)
		}
		cc = 1
		player.Niveau += 1
		player.EXP_restant = courbe_exp(player.Niveau + 1) - player.EXP
	}
}
	
function call_object(object, determinant = 0, quantity = 1) {
	if quantity > 1 {
		var word = object.name_conj[1]
		word = string(quantity) + " " + word
	} else {
		var word = object.name
		if determinant == 0 {
			var carac = ord(string_char_at(word, 1))
			word = string_delete(word, 1, 1)
			word = chr(carac-32) + word
		} else {
			if object.name_conj[0] == 0 {
				word = "un " + word
			} else {
				word = "une " + word
			}
		}
	}
	return word
}