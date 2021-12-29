extends RichTextLabel

var value = 0
var updated = false

func _physics_process(delta):
	text = "Wood: " + String(value)


func _on_GUI_updatewood(num):
	if not updated:
		value += num
		updated = true
		yield(get_tree().create_timer(0.5),"timeout")
		updated = false
