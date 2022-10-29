targetInstance = noone
fade = 1
fadeDirection = -1
team_overworld(240, 400)

window_ajust()

var loc = ""
var file = file_text_open_read("lang_fr.json")
while (!file_text_eof(file))
{
 loc += file_text_readln(file)
}
file_text_close(file)

global.loc = json_decode(loc)

//if !audio_is_playing(mus_forest01) {
 //   audio_play_sound(mus_forest01, 9, true)
//}