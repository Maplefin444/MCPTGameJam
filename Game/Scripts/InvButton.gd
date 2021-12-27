extends Panel

var resources = 0
signal update(num)

func _on_Button_pressed():
	visible = !visible

func _on_Decrement_pressed():
	resources -= 1
	emit_signal("update",resources)

func _on_Increment_pressed():
	resources += 1
	emit_signal("update",resources)
