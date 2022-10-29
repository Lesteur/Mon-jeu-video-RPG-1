function TransitionPlaceSequence(type, x, y) {
	if layer_exists("transition") {
		layer_destroy("transition")
	}
	var lay = layer_create(-9999, "transition")
	layer_sequence_create(lay, x, y, type)
}