global.icon = ds_map_create()
global.icon[? "heal"] = 0
global.icon[? "fire"] = 8
global.icon[? "ice"] = 9
global.icon[? "thunder"] = 10
global.icon[? "slash"] = 16
global.icon[? "object"] = 20

global.color_element = ds_map_create()
global.color_element[? false] = c_white
global.color_element[? "fire"] = c_red
global.color_element[? "ice"] = c_teal
global.color_element[? "thunder"] = c_yellow

global.boost_icon = ds_map_create()
global.boost_icon[? "attack"] = 0
global.boost_icon[? "magic_attack"] = 1
global.boost_icon[? "defense"] = 2
global.boost_icon[? "magic_defense"] = 3
global.boost_icon[? "agility"] = 4
global.boost_icon[? "accuracy"] = 5

global.boost_num = ds_map_create()
global.boost_num[? "-4"] = (1/3)
global.boost_num[? "-3"] = 0.4
global.boost_num[? "-2"] = 0.5
global.boost_num[? "-1"] = (2/3)
global.boost_num[? "0"] = 1
global.boost_num[? "1"] = 1.5
global.boost_num[? "2"] = 2
global.boost_num[? "3"] = 2.5
global.boost_num[? "4"] = 3