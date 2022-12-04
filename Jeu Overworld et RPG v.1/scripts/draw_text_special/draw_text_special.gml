function draw_text_special(text, x, y, w, z) {
	var heig = 0
	var cc = 1
	var widt = 0
	var col = c_white
	var effect = 0
	var cx = 0
	var t = global.t

	var amplitude = 2.5
	var freq = 2
	var charSize = 1

	repeat(string_length(text)) {
	 //Get current letter
 
		var letter = string_char_at(text, cc)
		var l_w = string_width(string_hash_to_newline(string_char_at(text, cc)))

		if (widt + l_w > w) || (letter == "#") {
			widt = 0
			heig += z
			if (letter == " ") {
				widt -= string_width(string_hash_to_newline(" "))
			}
		}
 
	switch(letter) {
		case "<":
			cx = 3
			break
		case "@":
			cx = 2
			break
		case "/": //normal
			effect = 0
			cx++
			col = c_white
			break
		case "¤": //shakey
			effect = 1
			cx++
			break
		case "~": //wave
			effect = 2
			cx++
			break
		case "_": //flat wave
			effect = 3
			cx++
			break
		case "£": //wave AND colour shift
			effect = 4
			cx++
			break
		case "µ": //spin
			effect = 5
			cx++
			break
		case "\\": //flicker
			effect = 6
			cx++
			break
	}
	
	if (cx == 2) {
		cc ++
		var letter = string_char_at(text, cc)
		switch(letter) {
			case "r": //normal
				col = c_red
				cx = 1
				break
			case "b": //normal
				col = c_teal
				cx = 1
				break
		}
	}
	
	if letter == "*" {
		var shake1 = random_range(-0.5,0.5)
		var shake2 = random_range(-0.5,0.5)
		draw_sprite_ext(bad_words, cc, x + 1 + widt + shake1, y + 1 + heig + shake2, 1, 1, 0, c_black, 1)
		draw_sprite_ext(bad_words, cc, x + widt + shake1, y + heig + shake2, 1, 1, 0, col, 1)
		widt += 9
	} else if (cx == 0) {
		switch(effect) {
			case 0: //normal
				draw_text(x + 1 + widt, y + 1 + heig, string_hash_to_newline(letter))
				draw_text_color(x + widt, y + heig, string_hash_to_newline(letter), col, col, col, col, 1)
				break

			case 1: //shakey
				var shake1 = random_range(-0.5,0.5)
				var shake2 = random_range(-0.5,0.5)
				draw_text(x + 1 + widt + shake1, y + 1 + heig + shake2, string_hash_to_newline(letter))
				draw_text_color(x + widt + shake1, y + heig + shake2, string_hash_to_newline(letter), col, col, col, col, 1)
				break
    
			case 2: //wave
				var so = t + cc
				var shift = sin(so*pi*freq/room_speed)*amplitude
				draw_text(x + 1 + widt, y + 1 + heig + shift, string_hash_to_newline(letter))
				draw_text_color(x + widt, y + heig + shift, string_hash_to_newline(letter), col, col, col, col, 1)
				break
    
			case 3: //flat wave
				var so = t;
				var shift = sin(so*pi*freq/room_speed)*amplitude
				draw_text(x + 1 + widt, y + 1 + heig + shift, string_hash_to_newline(letter))
				draw_text_color(x + widt, y + heig + shift, string_hash_to_newline(letter), col, col, col, col, 1)
				break
    
			case 4: //wave AND colour shift
				var so = t + cc
				var shift = sin(so*pi*freq/room_speed)*amplitude
				var c1 = make_colour_hsv(t+cc, 255, 255)
				var c2 = make_colour_hsv(t+cc+45, 255, 255)
				draw_text(x + 1 + widt, y + 1 + heig + shift, string_hash_to_newline(letter))
				draw_text_color(x + widt, y + heig + shift, string_hash_to_newline(letter), c1, c1, c2, c2, 1)
				break
    
			case 5: //spin
				var so = t + cc
				var shift = sin(so*pi*freq/room_speed)
				var mv = charSize/2
				draw_text_transformed(x + 1 + widt + mv, y + heig, string_hash_to_newline(letter), 1, 1, shift*10)
				draw_text_transformed_color(x + widt + mv, y + heig, string_hash_to_newline(letter), 1, 1, shift*10, col, col, col, col, 1)
				break
            
			case 6: //flicker
				var so = t + cc
				var shift = sin(so*pi*freq/room_speed)
				draw_text(x + 1 + widt, y + 1 + heig, string_hash_to_newline(letter))
				draw_text_color(x + widt, y + heig, string_hash_to_newline(letter), col, col, col, col, shift+random_range(-1,1));
				break
		}
		widt += l_w
	} else if cx == 3 {
		cc ++
		var code = ""
		var type = string_char_at(text, cc)
		cc ++
		var letter = string_char_at(text, cc)
		while (letter != ">") && cc < string_length(text) {
			code += letter
			cc ++
			var letter = string_char_at(text, cc)
		}
		if letter == ">" {
			if type = "o" {
				draw_sprite_ext(sprite_objects, real(code), x + widt, y + heig - 15, 1, 1, 0, c_white, 1)
				widt += 15
			} else if type = "e" {
				draw_sprite_ext(icons, real(code), x + widt, y + heig - 13, 1, 1, 0, c_white, 1)
				widt += 13
			}
		}
	}
       
	 //Increment variables for next letter
	cx = 0
	cc += 1
	}
}
