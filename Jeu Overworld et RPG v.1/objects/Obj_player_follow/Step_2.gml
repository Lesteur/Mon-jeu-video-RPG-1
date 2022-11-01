if ds_queue_size(following.queue) > 10 {

	var x_y = ds_queue_dequeue(following.queue)
	x += x_y[0]
	y += x_y[1]
	sprite_index = list[x_y[2]]
	ds_queue_enqueue(queue, x_y)
}

if global.interact != 2 {
image_index = following.image_index
}
set_depth()