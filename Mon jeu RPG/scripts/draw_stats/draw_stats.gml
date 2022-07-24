function draw_stats(){
	var b = ["attack", "magic_attack", "defense", "magic_defense", "agility", "accuracy"]
	var a = []
	for (var i = 0; i < 6; i++) {
		if boost[? b[i]][0] != 0 {
			var length = array_length(a)
			array_insert(a, length, [i, boost[? b[i]][0]])
		}
	}
	
	if !Obj_manager_fight.act and array_length(a) {
		
		if array_length(a) > 1 {
			ss += 0.025
		}
		
		if ss >= array_length(a) {
			ss = 0
		}
		
		var col = noone
		var inc = 0
		
		if a[floor(ss)][1] > 0 {
			col = c_red
			inc = a[floor(ss)][1] + 3
		} else {
			col = c_blue
			inc = a[floor(ss)][1] + 4
		}
		
		draw_sprite_ext(inc_stats, a[floor(ss)][0], x*2 + 14, y*2 - 30, 1, 1, 1, col, 1)
		draw_sprite_ext(inc_stats_plus, inc, x*2 + 38, y*2 - 32, 1, 1, 1, col, 1)
		
	} else {
		ss = 0
	}
	
}