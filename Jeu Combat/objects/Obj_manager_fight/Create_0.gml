issue_battle = false
act = false //montre si une action a été choisie
menu_effect = 0 //positionne le menu et la fiche associée
impact = false
flashAlpha = 0

choice_skill = 0
choice_objets = 0
choix_enemy = 1 //détermine l'attaque ennemi
enemy_target = 0
choix = 0 //attaque à choisir
target = 0 //cible à attaquer
all_target = false //si toute l'équipe est ciblée

form_ally = "none"
//form_ally2 = 0
form_choice = 0
form_turn = 0

menu = ["action"]
menu_i = 0

compte = 0 //anime l'effet
compte_flash = 0 //anime l'effet flash
effect_target = false //contient le sprite de l'effet pour la cible
effect_lanceur = false //contient le sprite de l'effet pour le lanceur
t = 0 //anime l'effet dégats
out = false //arrête l'effet dégats

damage = false //dégats
damage_show = false //montre les dégats
cible = false //contient l'objet cible
lanceur = false //contient l'objet lanceur
type_attack = false

global.team = [Obj_Luke, Obj_Matt] //Equipe des héros
global.team_enemy = [Obj_enemy_1, Obj_enemy_2] //Equipe des monstres
team_a = global.team
team_enemy_a = global.team_enemy

form_team = global.team

//team_target = global.team_enemy

team_target = team_a //équipe à cibler
turn = 0 //Tour par membre
turn_team = global.team //Equipe qui joue actuellement
team_KO = 0 //Membres de l'équipe KO
enemy_KO = 0 //Monstres KO
turn_fight = 0

message_routine = ["Un germicroque apparaît !", "Le germicroque vous menace avec ses dents.", "C'est un ennemi plutôt faible, vous devriez vous en sortir...", "Bon, qu'allez vous faire ?"]
message_quick = false
message_quick_t = 0
message_i = 0
message_monitor = message_routine[message_i]

compte_i = 0

dispo_team()

particules()

audio_play_sound(mus_rude_buster, 10, true)