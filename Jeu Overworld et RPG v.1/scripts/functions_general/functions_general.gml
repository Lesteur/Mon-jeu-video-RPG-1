function window_ajust() {
	if display_get_dpi_x() >= 120 {
		window_set_size(1200, 840)
	} else {
		window_set_size(800, 560)
	}
	display_set_gui_size(display_get_gui_width(), display_get_gui_height())
	alarm[1] = 1
}

function window_resize() {
	if keyboard_check_pressed(vk_f1) {
		if window_get_width() == 800 {
			window_set_size(1200, 840)
		} else if window_get_width() == 1200 {
			window_set_fullscreen(true)
		} else {
			window_set_fullscreen(false)
			window_set_size(800, 560)
		}
		display_set_gui_size(display_get_gui_width(), display_get_gui_height())
	}
	alarm[1] = 1
}