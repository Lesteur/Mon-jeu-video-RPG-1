var player = global.player
fade = 1
fadeDirection = -1
global.interact = 1
if room != room_battlefield_forest {
	alarm[0] = 25
}

// Go to target instance
if (instance_exists(targetInstance)) {
 // Create player
	team_overworld(0, 0)

var hor_direct = 0
var ver_direct = 0
switch(targetInstance.direction)
 {
  case 1:
   hor_direct = 30
   player.sprite_index = player.sprite_walk_right
   break
  case 2:
   ver_direct = 30
   player.sprite_index = player.sprite_walk_bottom
   break
  case 3:
   hor_direct = -30
   player.sprite_index = player.sprite_walk_left
   break
  case 4:
   ver_direct = -30
   player.sprite_index = player.sprite_walk_top
   break
 }
	
 // Move player to target
for (var i = 0; i < array_length(global.team_player); i++) {
	var p = global.team_player[i]
	p.x = targetInstance.x + targetInstance.sprite_width/2 + hor_direct
	p.y = targetInstance.y + targetInstance.sprite_height/2 + ver_direct
	ds_queue_clear(p.queue)
}
 // Clear target
 targetInstance = noone
}