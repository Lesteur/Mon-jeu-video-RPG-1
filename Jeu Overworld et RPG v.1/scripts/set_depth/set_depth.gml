function set_depth(d = 2) {
	var player = global.player
	if player.y < y+(0.5*sprite_height) {
		depth = player.depth - d
	} else {
		depth = player.depth + d
	}
}

function follow_depth() {
	var player = following
	if player.bbox_bottom < bbox_bottom {
		depth = player.depth - 4
	} else {
		depth = player.depth + 4
	}
	if y == player.y {
		depth = player.depth
	}
}