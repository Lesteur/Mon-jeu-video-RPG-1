interact_overworld()

if (interact == 1) {
	interact = 0
	if (global.player.y < y) {
		var m = [[langtext("Panneau_1_1")]]
		var scene = [ [cutscene_dialogue, m] ]
		create_cutscene(scene)
	} else {
		create_cutscene(t_scene_info)
		compteur ++
		global.room_data[? Zone_true_1][0] = compteur
		if compteur == 1 {
			message = [[langtext("Panneau_1_7")], [langtext("Panneau_1_8")]]
		} else {
			message = [[langtext("Panneau_1_9")]]
		}
		t_scene_info = [ [cutscene_dialogue, message] ]
	}
}