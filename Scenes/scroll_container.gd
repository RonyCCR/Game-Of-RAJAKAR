extends ScrollContainer

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			scroll_vertical += 40
			accept_event()
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			scroll_vertical -= 40
			accept_event()
