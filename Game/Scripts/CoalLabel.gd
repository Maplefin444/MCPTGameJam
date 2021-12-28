extends RichTextLabel
var value = 0

func _on_Holder_update(num):
	value += num
	text = "Coal: " + String(value)
	

func _on_GUI_update(num):
	value += num
	text = "Coal: " + String(value)
