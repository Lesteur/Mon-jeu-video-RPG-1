issue_battle = false //issue du combat
act = false //montre si une action a été choisie
menu_effect = 0 //positionne le menu et la fiche associée
impact = false //dit quand l'ennemi est touché
flashAlpha = 0 //Effet de flash

choice_exam = 0
choice_skill = 0 //compétence à choisir
choice_objets = 0 //object à choisir
choice_enemy = 1 //détermine l'attaque ennemi
enemy_target = 0 //cible de l'ennemi
choice = 0 //attaque à choisir
target = 0 //cible à attaquer
all_target = noone //si toute l'équipe est ciblée

ally_form = noone //allié choisi dans la formation
choice_form = 0 //allié à échanger dans la formation
turn_form = 0 //tours avant que la formation ne redevienne disponible
turn_battle = 1 //Tours totaux de la bataille

historique_actions = []

menu = ["action"] //liste de progression du menu
menu_i = 0 //indice du menu

compte = 0 //anime l'effet
compte_flash = 0 //anime l'effet flash
effect_target = false //contient le sprite de l'effet pour la cible
effect_lanceur = false //contient le sprite de l'effet pour le lanceur
t = 0 //anime l'effet dégats
cursor_i = 0
out = false //arrête l'effet dégats

damage = false //dégats
damage_show = false //montre les dégats
cible = false //contient l'objet cible
lanceur = false //contient l'objet lanceur
type_attack = false //genre de l'attaque
color_attack = [0]

global.team = [Obj_Luke, Obj_Matt, Obj_Arthur] //Equipe des héros

//global.team_enemy = [Obj_enemy_1, Obj_enemy_2]
global.team_enemy = [global.germicroque, global.germicroque] //Equipe des monstres
create_team()

team_a = global.team //Equipe héros excluant les KO
team_enemy_a = global.team_enemy //Equipe monstres excluant les KO

team_form = global.team //Equipe de la formation

team_target = team_a //équipe à cibler
turn = 0 //Tour par membre
turn_team = global.team //Equipe qui joue actuellement
team_KO = 0 //Membres de l'équipe KO
enemy_KO = 0 //Monstres KO

message_routine = ["Un germicroque apparaît !", "Le germicroque vous menace avec ses dents.", "C'est un ennemi plutôt faible, vous devriez vous en sortir...", "Bon, qu'allez vous faire ?"] //Messages affichés lors des combats
message_quick = false //Message rapide
message_quick_t = 0 //Durée du message rapide
message_i = 0 //Indice du message
message_monitor = message_routine[message_i] //Message affiché lors du combat
compte_i = 0
i_status = 0

function get_icon(icon) {
	return global.icon[? icon]
}

dispo_team()

//audio_play_sound(mus_rude_buster, 10, true)