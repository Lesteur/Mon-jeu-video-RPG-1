var player = global.player
type_interact = 2

t1 = [ [cutscene_dialogue, [["Ah... Ouf, ~hahaha !"], ["Tant mieux, j'ai eu un peu peur..."]]],
	[cutscene_dialogue, [["¤Bon. /Dans ce cas, je vais me reposer."], ["Au revoir !"]]],
	[cutscene_change_sprite, player, "sprite_walk_bottom", 0.15, 0],
	[cutscene_move_character, player, [0, 100], true, 2],
	[cutscene_reset_allies]
]

t2 = [ [cutscene_dialogue, [["..."],["¤Gloups..."],["¤J'ai peur..."]]], [cutscene_reset_allies] ]

t_scene_info = [
	[cutscene_change_sprite, player, "sprite_walk_top", 0, 0],
	[cutscene_remove_allies],
	[cutscene_change_sprite, player, "sprite_walk_top", 0.15, 0],
	[cutscene_move_character, player, [0, -100], true, 2],
	[cutscene_change_sprite, player, "sprite_walk_bottom", 0, 0],
	[cutscene_wait, 2],
	[cutscene_change_sprite, player, "sprite_walk_left", 0, 0],
	[cutscene_wait, 2],
	[cutscene_change_sprite, player, "sprite_walk_right", 0, 0],
	[cutscene_wait, 2],
	[cutscene_change_sprite, player, "sprite_walk_bottom", 0, 0],
	[cutscene_wait, 2],
	[cutscene_dialogue, [["Alors, alors, alors..."]]],
	[cutscene_dialogue, [["..."], ["Heu... Hé... Il... Il y a quelqu'un... ?"], ["S'il vous plaît... ?", 0, 0, ["Oui", "Non"], "reponse"]]],
	[cutscene_add, "reponse", [t1, t2]],
	]