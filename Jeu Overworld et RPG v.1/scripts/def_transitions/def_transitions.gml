function TransitionPlaceSequence(type) {
	if layer_exists("transition") {
		layer_destroy("transition")
	}
	var lay = layer_create(-9999, "transition")
	layer_sequence_create(lay, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), type)
}

function TransitionEffect(motif) {
	switch(motif) {
		case "in":
			Obj_manager.fade = 0.01
			Obj_manager.fadeDirection = 1
			break
		case "out":
			Obj_manager.fade = 1
			Obj_manager.fadeDirection = -1
			break
		default:
			Obj_manager.cc = 0.01
			Obj_manager.transition = motif
			
	}
}