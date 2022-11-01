interact_overworld()

if (interact == 1) {
	interact = 0
	if (global.player.y < y) {
		var m = [["Tu fais quoi, mon pote ? _Attends, j'ai aussi quelque chose d'écrit sur le #dos ???"]]
		var scene = [ [cutscene_dialogue, m] ]
		create_cutscene(scene)
	} else {
		create_cutscene(t_scene_info)
	}
}