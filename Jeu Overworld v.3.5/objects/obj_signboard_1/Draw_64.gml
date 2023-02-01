if (global.player.y < y) {

	message = [[global.loc[? "Panneau_1_1"]]]

} else if (compteur == 0) {

	message = [[global.loc[? "Panneau_1_2"], "Luke", Luke_neutre],
			[global.loc[? "Panneau_1_3"]],
			[global.loc[? "Panneau_1_4"]],
			[global.loc[? "Panneau_1_5"]],
			[global.loc[? "Panneau_1_6"], "Luke", Luke_embarras]]

} else if (compteur == 1) {
	
	message = [[global.loc[? "Panneau_1_7"]],
				[global.loc[? "Panneau_1_8"]]]

} else {
	message = [[global.loc[? "Panneau_1_9"]]]
}

if (interact == 1) {
	function_dialogue(message)
	if (global.i == array_length(message)) {
		compteur ++
	}
	
} else {
	set_depth()
	not_interaction()
}