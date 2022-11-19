interact_overworld()

if (interact == 1) {
	interact = 0
	if (global.player.y < y) {
		var m = [["... Les coffres ne s'ouvrent pas de ce côté, vous savez ?"]]
		var scene = [ [cutscene_dialogue, m] ]
		create_cutscene(scene)
	} else {
		if compteur == 0 {
			create_cutscene(t_scene_info)
			compteur ++
		} else {
			create_cutscene([[cutscene_dialogue, [["Il n'y a rien dedans."]] ]])
		}
	}
}