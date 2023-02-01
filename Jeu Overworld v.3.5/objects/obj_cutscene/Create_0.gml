var player = Obj_Luke
scene_info = 0
new_scene_info = 0
scene = 0
draw = false
draw_t = false
reponse = 0

timer = 0
global.i = 0
global.reponse = 0

scene_info = [
	[cutscene_change_sprite, player, Luke_marche_haut, 0.15, 0],
	//[cutscene_move_character, Joueur, [0, 20], true, 3],
	//[cutscene_wait, 4]
	//[cutscene_box],
	//[cutscene_wait, 4],
	//[cutscene_box]
]

event_perform(ev_other, ev_user0)

x_dest = -1
y_dest = -1