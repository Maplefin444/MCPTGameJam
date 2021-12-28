extends Panel

signal update(num)

func _on_Button_pressed():
	visible = !visible

func _on_Decrement_pressed():
	emit_signal("update",-1)

func _on_Increment_pressed():
	emit_signal("update",1)
