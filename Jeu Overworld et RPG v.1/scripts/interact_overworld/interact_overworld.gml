function interact_overworld() {
	if global.interact == 0 {
		var player = global.player
		if (((place_meeting(x+xbord, y, player) && player.sprite_index = player.sprite_walk_left) || (place_meeting(x-xbord, y, player) && player.sprite_index = player.sprite_walk_right)) && keyboard_check_pressed(vk_space)) {
			interact ++
			global.interact ++
			global.reponse = 0
			global.i = 0
		} else if (((place_meeting(x, y+ybord, player) && player.sprite_index = player.sprite_walk_top) || (place_meeting(x, y-ybord, player) && player.sprite_index = player.sprite_walk_bottom)) && keyboard_check_pressed(vk_space)) {
			interact ++
			global.interact ++
			global.reponse = 0
			global.i = 0
		}
	}
}