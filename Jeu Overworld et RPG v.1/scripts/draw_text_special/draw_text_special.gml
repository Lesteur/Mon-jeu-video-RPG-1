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
	var ec = 0
	var charSize = 1

	repeat(string_length(text)) {
	 //Get current letter
 
		var letter = string_char_at(text, cc)

		if (widt > w) || (letter == "#") {
			widt = 0
			heig += z
			if (letter == " ") {
				widt -= string_width(string_hash_to_newline(" "))
			}
		}
 
	switch(letter) {
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
 
	if (cx == 0) {
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
		widt += string_width(string_hash_to_newline(string_char_at(argument0, cc)))
	}
       
	 //Increment variables for next letter
	cx = 0
	cc += 1
	}
}
