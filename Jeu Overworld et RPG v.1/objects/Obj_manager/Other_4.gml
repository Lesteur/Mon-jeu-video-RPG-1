TransitionEffect("out")
cc = 0
global.interact = 1

// Go to target instance
if (instance_exists(targetInstance)) {
 // Create player
	team_overworld(0, 0)
	var player = global.player
	var hor_direct = 0
	var ver_direct = 0
	var sp = 0
	switch(targetInstance.direction)
	 {
	  case 1:
	   hor_direct = 10
	   player.sprite_index = player.sprite_walk_right
	   sp = 3
	   break
	  case 2:
	   ver_direct = 10
	   player.sprite_index = player.sprite_walk_bottom
	   sp = 0
	   break
	  case 3:
	   hor_direct = -10
	   player.sprite_index = player.sprite_walk_left
	   sp = 2
	   break
	  case 4:
	   ver_direct = -10
	   player.sprite_index = player.sprite_walk_top
	   sp = 1
	   break
	 }
	
	 // Move player to target
	for (var i = 0; i < array_length(global.team_player); i++) {
		var p = global.team_player[i]
		p.x = targetInstance.x + targetInstance.sprite_width/2 + hor_direct*3 - hor_direct*2*i
		p.y = targetInstance.y + targetInstance.sprite_height/2 + ver_direct*3 - ver_direct*2*i
		p.sprite_index = p.list[sp]
		ds_queue_clear(p.queue)
		repeat(10) {
			ds_queue_enqueue(p.queue, [ hor_direct/5, ver_direct/5, sp])
		}
	}
	 // Clear target
	 targetInstance = noone
}

if room != room_battlefield_forest || room != room_menu {
	alarm[0] = 25
}

if chang_team {
	for (var i = 0; i < array_length(global.team_v); i++) {
		var inst = global.team_player[i]
		var ps = global.team_v[i]
		switch(inst.sprite_index) {
			case inst.sprite_walk_bottom:
				inst.sprite_index = ps.sprite_walk_bottom
				break
			case inst.sprite_walk_top:
				inst.sprite_index = ps.sprite_walk_top
				break
			case inst.sprite_walk_left:
				inst.sprite_index = ps.sprite_walk_left
				break
			case inst.sprite_walk_right:
				inst.sprite_index = ps.sprite_walk_right
				break
		}
		inst.sprite_walk_bottom = ps.sprite_walk_bottom
		inst.sprite_walk_top = ps.sprite_walk_top
		inst.sprite_walk_left = ps.sprite_walk_left
		inst.sprite_walk_right = ps.sprite_walk_right
		inst.list = [inst.sprite_walk_bottom, inst.sprite_walk_top, inst.sprite_walk_left, inst.sprite_walk_right]
	}
	chang_team = false
}