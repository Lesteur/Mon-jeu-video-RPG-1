interact = 0
compteur = 0
xbord = 0
ybord = 2
set_depth()

message = [[global.loc[? "Panneau_1_2"], "Luke"], [global.loc[? "Panneau_1_3"]],
			[global.loc[? "Panneau_1_4"]], [global.loc[? "Panneau_1_5"]],
			[global.loc[? "Panneau_1_6"], "Luke"]]

t_scene_info = [ [cutscene_change_variable, "global", "money", 50, true], [cutscene_dialogue, message ] ]