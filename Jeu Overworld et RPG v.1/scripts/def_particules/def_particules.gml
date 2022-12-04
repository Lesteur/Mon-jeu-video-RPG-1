global.partSystem100 = part_system_create()
part_system_depth(global.partSystem100, -100)
global.partSystem50 = part_system_create()
part_system_depth(global.partSystem50, -50)

var p = part_type_create()
part_type_sprite(p, basic_sword_neutral, true, true, false)
part_type_life(p, 7, 7)
part_type_size(p, 1, 1, 0, 0)
global.part_attack = p

//Effect heal PV
var p = part_type_create()
part_type_sprite(p, effect_heal_pv, true, true, false)
part_type_life(p, 25, 25)
part_type_alpha3(p, 1, 1, 0)
part_type_size(p, 1, 1, 0, 0)
part_type_speed(p, 1.1, 1.2, 0, 0)
part_type_direction(p, 90, 90, 0, 0)
part_type_orientation(p, 0, 359, 5, 0, 0)
global.part_heal = p

//Effect heal PM
var p = part_type_create()
part_type_sprite(p, effect_heal_pm, true, true, false)
part_type_life(p, 25, 25)
part_type_alpha3(p, 1, 1, 0)
part_type_size(p, 1, 1, 0, 0)
part_type_speed(p, 1.1, 1.2, 0, 0)
part_type_direction(p, 90, 90, 0, 0)
part_type_orientation(p, 0, 359, 5, 0, 0)
global.part_heal_pm = p

//Following fireball
var p = part_type_create()
part_type_sprite(p, effect_fireball, false, false, false)
part_type_life(p, 20, 20)
part_type_alpha2(p, 0.5, 0)

global.part_Fireball = p

//Explosion
var p = part_type_create()
part_type_sprite(p, effect_explosion, true, true, false)
part_type_life(p, 25, 25)
part_type_size(p, 1, 1, 0, 0)

global.part_Explosion = p

//Iceblock
var p = part_type_create()
part_type_sprite(p, effect_snowflake, false, false, false)
part_type_life(p, 60, 60)
part_type_alpha3(p, 1, 1, 0)
part_type_size(p, 1.5, 1.5, -0.05, 0)
part_type_speed(p, 3.5, 3.5, -0.1, 0)
part_type_direction(p, 0, 359, 0, 0)

global.part_Snowflake = p

//Poison
var p = part_type_create()
part_type_sprite(p, effect_poison, false, false, false)
part_type_life(p, 40, 40)
part_type_alpha3(p, 1, 1, 0)
part_type_speed(p, 1, 1, -0.05, 0)
part_type_direction(p, 90, 90, 0, 0)
part_type_gravity(p, 0.05, 90)

global.part_Poison = p