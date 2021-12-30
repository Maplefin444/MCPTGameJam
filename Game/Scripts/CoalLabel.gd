extends RichTextLabel

var value = 0
var updated = false

func _physics_process(delta):
	text = " Coal: " + String(value)


func _on_GUI_updatecoal(num):
	value += num
