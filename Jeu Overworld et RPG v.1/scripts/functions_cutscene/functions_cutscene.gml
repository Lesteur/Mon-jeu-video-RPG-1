function cutscene_wait(seconds){
	timer ++
	if timer >= seconds*room_speed {
		timer = 0
		cutscene_end_action()
	}
}

function cutscene_create_obj(pos, pos_layer, obj){
	instance_create_layer(pos[0], pos[1], pos_layer, obj)
	cutscene_end_action()
}

function cutscene_end_action() {
	scene++
	if scene >= array_length(scene_info) {
		instance_destroy()
		global.interact = 0
		exit
	}
	
	event_perform(ev_other, ev_user0)
}

function cutscene_dialogue(dialogue) {
	draw = ["dialogue", dialogue]
	if global.i == array_length(dialogue) {
		global.i = 0
		draw = false
		cutscene_end_action()
	}
}

function cutscene_play_sound(sound, priority, loops) {
	audio_play_sound(sound, priority, loops)
	cutscene_end_action()
}

function cutscene_destroy_instance(obj) {
	if !is_array(obj) {
		obj = [obj]
	}
	for (var i = 0; i < array_length(obj); i++) {
		with (obj[i]) {
			instance_destroy()
		}
	}
	cutscene_end_action()
}

function cutscene_destroy_nearest(pos, obj) {
	var inst = instance_nearest(pos[0], pos[1], obj)
	cutscene_destroy_instance(inst)
}

function cutscene_change_sprite(obj, sprite, spd, image) {
	if !is_array(obj) {
		obj = [obj]
	}
	for (var i = 0; i < array_length(obj); i++) {
		with (obj[i]) {
			if is_string(sprite) {
				sprite = variable_instance_get(obj[i], sprite)
			}
			sprite_index = sprite
			image_speed = spd
			if spd == 0 {
				image_index = image
			}
		}
	}
	cutscene_end_action()
}

function cutscene_change_xscale(obj, image_xsc) {
	var arg
	var i = 0
	repeat(argument_count) {
		arg[i] = argument[i]
		i++
	}
	
	if argument_count > 1 {
		with (arg[0]) {
			image_xscale = arg[1]
		}
	} else {
		with (arg[0]) {
			image_xscale = -image_xscale
		}
	}
	cutscene_end_action()
}

function cutscene_change_variable(obj, variable, value) {
	with (obj) {
		variable_instance_set(obj, variable, value)
	}
	cutscene_end_action()
}

function cutscene_change_global_variable(variable, value) {
	variable_global_set(variable, value)
	cutscene_end_action()
}

function cutscene_add(variable, t_event) {
	new_scene_info = scene_info
	var v = variable_instance_get(Obj_cutscene, variable)
	var event = t_event[v]
	var len = array_length(event)
	for (var i = 0; i < len; i++) {
		array_insert(new_scene_info, array_length(new_scene_info), event[i])
	}
	scene++
	event_perform(ev_other, ev_user1)
}

function cutscene_move_character(obj, pos, relative, spd) {
	if x_dest == -1 {
		if !relative {
			x_dest = pos[0]
			y_dest = pos[1]
		} else {
			x_dest = obj.x + pos[0]
			y_dest = obj.y + pos[1]
		}
	}
	
	var xx = x_dest
	var yy = y_dest
	
	with(obj) {
		
		if point_distance(x, y, xx, yy) >= spd {
			var dir = point_direction(x, y, xx, yy)
			var ldirx = lengthdir_x(spd, dir)
			var ldiry = lengthdir_y(spd, dir)
		
			x += ldirx
			y += ldiry
		} else {
			x = xx
			y = yy
			
			with(other) {
				x_dest = -1
				y_dest = -1
				cutscene_end_action()
			}
		}
	}
}

function cutscene_remove_allies() {
	
	if x_dest == -1 {
			x_dest = global.player.x
			y_dest = global.player.y
	}
	
	var xx = x_dest
	var yy = y_dest
	
	var team_ally = []
	array_copy(team_ally, 0, global.team_player, 1, array_length(global.team_player))
	players = []
	array_resize(players, array_length(team_ally))
	for (var i = 0; i < array_length(team_ally); i++) {
		with(team_ally[i]) {
		
			if point_distance(x, y, xx, yy) >= 2 {
				var dir = point_direction(x, y, xx, yy)
				var ldirx = lengthdir_x(2, dir)
				var ldiry = lengthdir_y(2, dir)
				
				if abs(ldirx) > abs(ldiry) {
					if ldirx > 0 {
						sprite_index = sprite_walk_right
					} else {
						sprite_index = sprite_walk_left
					}
				} else {
					if ldiry > 0 {
						sprite_index = sprite_walk_bottom
					} else {
						sprite_index = sprite_walk_top
					}
				}
				image_speed = 0.15
		
				x += ldirx
				y += ldiry
			} else {
				x = xx
				y = yy
				visible = false
			
				with(other) {
					players[i] = 1
					x_dest = -1
					y_dest = -1
					if !research_array(players, 0) {
						cutscene_end_action()
					}
				}
			}
		}
	}
	
}

function cutscene_reset_allies() {
	for (var i = 0; i < array_length(global.team_player); i++) {
		var player = global.team_player[i]
		player.x = global.player.x
		player.y = global.player.y
		player.visible = true
		ds_queue_clear(player.queue)
	}
	cutscene_end_action()
}

function create_cutscene(t_scene) {
	var inst = instance_create_layer(0, 0, "Instances_1", Obj_cutscene)
	with (inst) {
		array_copy(scene_info, 1, t_scene, 0, array_length(t_scene))
	}
}