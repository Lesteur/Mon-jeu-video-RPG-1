function interact_overworld() {
	if global.interact == 0 {
		var player = global.player
		if (((place_meeting(x+xbord, y, player) && player.sprite_index = 2) || (place_meeting(x-xbord, y, player) && player.sprite_index = 3)) && keyboard_check_pressed(vk_space)) {
			interact ++
			global.interact ++
			global.reponse = 0
			global.i = 0
		} else if (((place_meeting(x, y+ybord, player) && player.sprite_index = 1) || (place_meeting(x, y-ybord, player) && player.sprite_index = 0)) && keyboard_check_pressed(vk_space)) {
			interact ++
			global.interact ++
			global.reponse = 0
			global.i = 0
		}
	}
}