function set_depth() {
	var player = global.player
	if player.y < y+(0.5*sprite_height) {
		depth = player.depth - 1
	} else {
		depth = player.depth + 1
	}
}