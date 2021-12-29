extends RichTextLabel
var value = 0

func _on_Holder_update(num):
	value += num

func _on_GUI_update(num):
	value += num

func _physics_process(delta):
	text = "Coal: " + String(value)
