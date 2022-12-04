interact = 0
compteur = 0
xbord = 0
ybord = 2
set_depth()
var i = image_index

message = "Vous avez obtenu <object> !"
message = string_replace(message, "<object>", call_object(loot[0], "number", loot[1]) + " <o"+string(loot[0].graphisme_1)+">")
message = [[message]]

t_scene_info = [ [cutscene_change_sprite, id, sprite_chest, 0, i+1], [cutscene_wait, 0.5], [cutscene_add_inventory, loot], [cutscene_dialogue, message ] ]