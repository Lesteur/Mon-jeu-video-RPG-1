if !instance_exists(Obj_cutscene) {
	if place_meeting(x, y, global.player) {
		global.interact = 2
		create_cutscene(t_scene_info)
		instance_destroy()
	}
}