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
		global.interact = 2
		cutscene_end_action()
	}
}

function cutscene_play_sound(sound, priority, loops) {
	audio_play_sound(sound, priority, loops)
	cutscene_end_action()
}

function cutscene_destroy_instance(obj) {
	with (obj) {
		instance_destroy()
	}
	cutscene_end_action()
}

function cutscene_destroy_nearest(pos, obj) {
	var inst = instance_nearest(pos[0], pos[1], obj)
	cutscene_destroy_instance(inst)
}

function cutscene_change_sprite(obj, sprite, spd, image) {
	with (obj) {
		sprite_index = sprite
		image_speed = spd
		if spd == 0 {
			image_index = image
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
		
		if point_direction(x, y, xx, yy) >= spd {
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

function create_cutscene(t_scene) {
	var inst = instance_create_layer(0, 0, "Instances_1", Obj_cutscene)
	with (inst) {
		scene_info = t_scene
	}
}