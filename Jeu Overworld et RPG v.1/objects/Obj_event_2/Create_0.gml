interact = 0
compteur = 0
xbord = 0
ybord = 2
set_depth()

var t3 = [[cutscene_dialogue, [["¤Argh ...! Et m**** !!!"], ["Bon OK, t'as gagné... Tu peux passer."]]], [cutscene_destroy_instance, self]]

var t1 = [[cutscene_dialogue, [["~Hin hin hin !/ Prépare-toi !"]]], [cutscene_fight, t3, global.team_v, [global.germicroque], {flee : 0} ]]
var t2 = [[cutscene_dialogue, [["~Tsss.../ Rabat-joie !"]]]]

t_scene_info = [ [cutscene_dialogue, [["Tiens tiens... Regardez un peu qui voilà !"], ["Tu veux passer, hein ? Alors, tu vas d'abord devoir me dégager du chemin !"], ["¤Alors, tu viens te battre ?", 0, 0, ["Oui", "Non"], "reponse"]] ],
				[cutscene_add, "reponse", [t1, t2]]	]