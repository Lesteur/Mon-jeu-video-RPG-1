if (global.player.y < y) {
	message = [["Tu fais quoi, mon pote ? _Attends, j'ai aussi quelque chose d'écrit sur le dos ???"]]

} else {
	
	message = [["Hé, salut, toi !"],
			["Dis... j'peux te poser une question ?"],
			["Est-ce que... ~tu me trouves beau ?", 0, 0, ["Tu es magnifique !", "T'es super laid !"], "reponse"]]

	if reponse == 0 {
		message[3] = ["µOoooh ! Ouais merci beaucoup ! Tu me fais super plaisir !"]
		message[4] = ["A plus, mon pote !"]
	} else {
		message[3] = ["... ¤QUOI ?!?! Mais ça va pas la tête ?! J'suis super beau !"]
		message[4] = ["Désolé mais j'fréquente pas ceux qui apprécient pas ma beauté. #Dégage s'il te plaît."]
	}

}

if (interact == 1) {
	function_dialogue(message)
} else {
	set_depth()
	not_interaction()
}

