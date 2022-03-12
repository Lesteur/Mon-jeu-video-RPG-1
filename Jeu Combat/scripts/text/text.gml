function text(argument0, argument1, argument2) {
	var heig = 0
	var cc = 1
	var widt = 0
	var col = c_white
	var effect = 0
	var cx = 0

	var amplitude = 20
	var freq = 2
	var ec = 0
	var charSize = 1

	repeat(string_length(argument2))
	{
	 //Get current letter
 
	 var letter = string_char_at(argument2, cc)
 
	 switch(letter)
	 {
	  case "@":
	   col = c_red
	   cx++
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
 
	 if (cx == 0)
	 {
	  switch(effect)
	  {
	   case 0: //normal
	    draw_text_color(argument0 + widt, argument1 + heig, letter, col, col, col, col, 1)
	    break
           
	   case 1: //shakey
	    var shake1 = random_range(-1,1)
	    var shake2 = random_range(-1,1)
	    draw_text_color(argument0 + widt + shake1, argument1 + heig + shake2, letter, col, col, col, col, 1)
	    break
    
	   case 2: //wave 1* (modifié)
	    var so = t + cc
		var trans = 0
		
	    var shift = -(sin(so*pi*freq/room_speed)*amplitude)
		if shift >= 0 || out >= 30 {
			shift = 0
			out = so
		}
		
		if out >= 40 {
			trans += 0.1
		}
		draw_text(argument0 + widt, argument1 + heig + shift, letter)
	    break
    
	   case 3: //flat wave
	    var so = t
	    var shift = sin(so*pi*freq/room_speed)*amplitude
		col = draw_get_color()
	    draw_text_color(argument0 + widt, argument1 + heig + shift, letter, col, col, col, col, 1)
	    break
    
	   case 4: //wave AND colour shift
	    var so = t + cc
	    var shift = sin(so*pi*freq/room_speed)*amplitude
	    var c1 = make_colour_hsv(t+cc, 255, 255)
	    var c2 = make_colour_hsv(t+cc+45, 255, 255)
	    draw_text_color(argument0 + widt, argument1 + heig + shift, letter, c1, c1, c2, c2, 1)
	    break
    
	   case 5: //spin
	    var so = t + cc
	    var shift = sin(so*pi*freq/room_speed)
	    var mv = charSize/2
	    draw_text_transformed_color(argument0 + widt + mv, argument1 + heig, letter, 1, 1, shift*10, col, col, col, col, 1)
	    break
            
	   case 6: //flicker
	    var so = t + cc
	    var shift = sin(so*pi*freq/room_speed)
	    draw_text(argument1 + 3 + widt, argument2 + 3 + heig, string_hash_to_newline(letter))
	    draw_text_color(argument1 + widt, argument2 + heig, string_hash_to_newline(letter), col, col, col, col, shift+random_range(-1,1));
	    break
	  }
	  widt += string_width(string_char_at(argument2, cc))
	 }
       
	 //Increment variables for next letter
	 cx = 0
	 cc += 1
	}



}