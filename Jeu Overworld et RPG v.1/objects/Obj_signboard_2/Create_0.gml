interact = 0
compteur = 0
xbord = 0
ybord = 2
set_depth()

var m1 = [ ["µOoooh ! Ouais merci beaucoup ! Tu me fais super plaisir !"], ["A plus, mon pote !"] ]
var m2 = [ ["... ¤QUOI ?!?! Mais ça va pas la tête ?! J'suis super beau !"], ["Désolé mais j'fréquente pas ceux qui apprécient pas ma beauté. #Dégage s'il te plaît."] ]
var t1 = [[cutscene_dialogue, m1 ]]
var t2 = [[cutscene_dialogue, m2 ]]


message = [["Hé, salut, toi !"],
			["Dis... j'peux te poser une question ?"],
			["Est-ce que... ~tu me trouves beau ?", 0, 0, ["Tu es magnifique !", "T'es super laid !"], "reponse"]]

t_scene_info = [ [cutscene_dialogue, message ], [cutscene_add, "reponse", [t1, t2]] ]