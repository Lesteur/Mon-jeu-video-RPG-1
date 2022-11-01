function draw_stats(){
	var b = ["attack", "magic_attack", "defense", "magic_defense", "agility", "accuracy"]
	var a = []
	for (var i = 0; i < 6; i++) {
		if boost[? b[i]][0] != 0 {
			var length = array_length(a)
			array_insert(a, length, [i, boost[? b[i]][0]])
		}
	}
	
	var c = ds_map_keys_to_array(status_list)
	
	if !Obj_manager_fight.issue_battle && !Obj_manager_fight.act {//&& (Obj_manager_fight.menu[Obj_manager_fight.menu_i] == "action") {
		
		if array_length(a) {
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
		
			draw_sprite_ext(inc_stats, a[floor(ss)][0], x + 7, y - 15, 1, 1, 1, col, 1)
			draw_sprite_ext(inc_stats_plus, inc, x + 19, y - 16, 1, 1, 1, col, 1)
		}
		
		if array_length(c) {
			if array_length(c) > 1 {
				zz += 0.025
			}
		
			if zz >= array_length(c) {
				zz = 0
			}
		
			draw_sprite(status_icon, global.status_num[? c[floor(zz)]], x + 7, y - 2)
		}
		
	} else {
		ss = 0
		zz = 0
	}
	
}