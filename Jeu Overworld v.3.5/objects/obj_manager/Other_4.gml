var player = global.player
fade = 1
fadeDirection = -1
global.interact = 1
alarm[0] = 25

// Go to target instance
if (instance_exists(targetInstance)) {
 // Create player
 if (!instance_exists(player)) {
  instance_create_layer(0, 0, "Instances_1", player)
}

var hor_direct = 0
var ver_direct = 0
switch(targetInstance.direction)
 {
  case 1:
   hor_direct = 30
   break
  case 2:
   ver_direct = 30
   break
  case 3:
   hor_direct = -30
   break
  case 4:
   ver_direct = -30
   break
 }
	
 // Move player to target
 player.x = targetInstance.x + targetInstance.sprite_width/2 + hor_direct
 player.y = targetInstance.y + targetInstance.sprite_height/2 + ver_direct
	
 // Clear target
 targetInstance = noone
}