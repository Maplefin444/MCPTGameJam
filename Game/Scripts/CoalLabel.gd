extends RichTextLabel

var value = 0
var updated = false


func _on_Holder_update(num):
	if not updated:
		value += num
		updated = true
		yield(get_tree().create_timer(0.5),"timeout")
		updated = false


func _physics_process(delta):
	text = " Coal: " + String(value)


func _on_GUI_updatecoal(num):
	value += num
