global.t = 0

global.icon = ds_map_create()
global.icon[? "heal"] = 0

global.icon[? "pm"] = 1
global.icon[? "attack"] = 2
global.icon[? "defense"] = 3
global.icon[? "magic_attack"] = 4
global.icon[? "magic_defense"] = 5
global.icon[? "accuracy"] = 6
global.icon[? "agility"] = 7

global.icon[? "fire"] = 8
global.icon[? "ice"] = 9
global.icon[? "thunder"] = 10
global.icon[? "water"] = 11
global.icon[? "wind"] = 12
global.icon[? "earth"] = 13
global.icon[? "dark"] = 14
global.icon[? "light"] = 15
global.icon[? "chaos"] = 16
global.icon[? "slash"] = 17
global.icon[? "pierce"] = 18
global.icon[? "pounding"] = 19
global.icon[? "magic"] = 20
global.icon[? false] = 21
global.icon[? "unknown"] = 22

global.color_element = ds_map_create()
global.color_element[? false] = c_white
global.color_element[? "fire"] = c_red
global.color_element[? "ice"] = make_color_rgb(176, 240, 248)
global.color_element[? "thunder"] = c_yellow
global.color_element[? "water"] = c_blue

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

global.status_num = ds_map_create()
global.status_num[? "burn"] = 0
global.status_num[? "freeze"] = 1
global.status_num[? "paralysis"] = 2
global.status_num[? "poison"] = 3

global.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]