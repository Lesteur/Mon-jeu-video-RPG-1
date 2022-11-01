team_overworld(x+10, y)

for (var i = 0; i < array_length(global.team_player); i++) {
	var inst = global.team_player[i]
	inst.y -= 20*i
	repeat(10) {
		ds_queue_enqueue(inst.queue, [0, 2, 0])
	}
}

instance_destroy()