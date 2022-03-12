global.partSystem100 = part_system_create()
part_system_depth(global.partSystem100, -100)
global.partSystem50 = part_system_create()
part_system_depth(global.partSystem50, -50)

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

//Effect increase attack
var p = part_type_create()
part_type_sprite(p, effect_increase_attack, true, true, false)
part_type_life(p, 20, 20)
part_type_alpha3(p, 1, 0.75, 0)
part_type_size(p, 1, 1, 0, 0)
part_type_speed(p, 2, 2, -0.1, 0)
part_type_direction(p, 90, 90, 0, 0)
part_type_orientation(p, 0, 0, 0, 0, true)
global.part_inc_att = p

//Following fireball
var p = part_type_create()
part_type_sprite(p, effect_fireball, false, false, false)
part_type_life(p, 20, 20)
part_type_alpha2(p, 0.5, 0)
part_type_size(p, 1, 1, 0, 0)

global.part_Fireball = p

//Explosion
var p = part_type_create()
part_type_sprite(p, effect_explosion, true, true, false)
part_type_life(p, 30, 30)
part_type_size(p, 1, 1, 0, 0)
part_type_speed(p, 3, 3, -0.05, 0)
part_type_direction(p, 0, 359, 0, 0)

global.part_Explosion = p

//Iceblock
var p = part_type_create()
part_type_sprite(p, effect_snowflake, false, false, false)
part_type_life(p, 60, 60)
part_type_alpha3(p, 1, 1, 0)
part_type_size(p, 1.5, 1.5, -0.05, 0)
part_type_speed(p, 3.5, 3.5, -0.1, 0)
part_type_direction(p, 0, 359, 0, 0)

global.ptIceblock = p

//Thunder
var p = part_type_create()
part_type_sprite(p, effect_volt, true, false, true)
part_type_life(p, 10, 10)
part_type_size(p, 0.5, 0.5, 0, 0.5)
part_type_speed(p, 0.05, 0.05, 0, 0)
part_type_direction(p, 0, 359, 0, 10)

global.ptThunder = p