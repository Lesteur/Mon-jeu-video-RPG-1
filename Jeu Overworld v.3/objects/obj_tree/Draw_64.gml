if (interact == 1) {
	if id == 100017 {
		message = [["Hum... Ouah ! Je ne sais pas pourquoi mais... cet arbre a l'air différent !", "Luke", Luke_surprise]]
	}
	function_dialogue(message)
} else {
	set_depth()
	not_interaction()
}