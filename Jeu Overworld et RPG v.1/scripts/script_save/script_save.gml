function type_variable(variable) {
	if is_real(variable) {
		return "number"
	} else if is_array(variable) {
		return "array"
	} else if is_struct(variable) {
		return "struct"
	} else {
		return "string"
	}
}

function write_data(file, data) {
	switch (type_variable(data)) {
		case "number":
			file_text_write_real(file, data)
			file_text_writeln(file)
			break
		case "array":
			file_text_write_real(file, array_length(data))
			file_text_writeln(file)
			for (var i = 0; i < array_length(data); i++) {
				write_data(file, data[i])
			}
			break
		case "struct":
			var len = variable_struct_names_count(data)
			var keys = variable_struct_get_names(data)
			file_text_write_real(file, len)
			file_text_writeln(file)
			for (var i = 0; i < len; i++) {
				write_data(file, variable_struct_get(data, keys[i]))
			}
			break
		case "string":
			file_text_write_string(file, data)
			file_text_writeln(file)
			break
	}
}

function load_data(file, data) {
	var elem = -1
	switch (type_variable(data)) {
		case "number":
			elem = file_text_read_real(file)
			file_text_readln(file)
			break
		case "array":
			var len = file_text_read_real(file)
			file_text_readln(file)
			var elem = []
			for (var i = 0; i < len; i++) {
				array_push(elem, load_data(file, data[i]))
			}
			break
		case "struct":
			var keys = variable_struct_get_names(data)
			var len = file_text_read_real(file)
			file_text_readln(file)
			var elem = {}
			for (var i = 0; i < len; i++) {
				variable_struct_set(elem, keys[i], load_data(file, data))
			}
			break
		case "string":
			elem = file_text_read_string(file)
			file_text_readln(file)
			break
	}
	return elem
}

function save_all_data(n) {
	var file = file_text_open_write("data_global"+string(n)+".txt")
	write_data(file, "Forêt des Tutoriels")
	write_data(file, global.timegame)
	write_data(file, array_length(global.team_v))
	var niv_moy = 0
	for (var i = 0; i < array_length(global.team_v); i++) {
		write_data(file, global.team_v[i].Num)
		niv_moy += global.team_v[i].Niveau
	}
	write_data(file, round(niv_moy/array_length(global.team_v)))
	file_text_close(file)
	
	save_team_stats(global.characters, n)
}

function save_team_stats(team, n) {
	var array = ["name", "Num", "EXP"]
	var file = file_text_open_write("data_team"+string(n)+".txt")
	var niv_moy = 0
	for (var i = 0; i < array_length(team); i++) {
		var player = team[i]
		niv_moy += player.Niveau
		for (var a = 0; a < array_length(array); a++) {
			write_data(file, variable_struct_get(player, array[a]))
		}
		file_text_writeln(file)
	}
	write_data(file, round(niv_moy/array_length(team)))
	file_text_close(file)
}

function load_menu_data() {
	var array = []
	for (var i = 0; i < 5; i++) {
		var file = "data_global"+string(i)+".txt"
		if !file_exists(file) {
			array_push(array, -1)
		} else {
			var f = file_text_open_read(file)
			var ar = []
			ar[0] = load_data(f, "")
			ar[1] = convert_time(load_data(f, 1))
			ar[2] = load_data(f, [0, 0, 0, 0])
			ar[3] = load_data(f, 1)
			array_push(array, ar)
			file_text_close(f)
		}
	}
	return array
}