extends CanvasLayer

signal update(num)

signal enter
signal exit

func _on_Minigame_finished(res):
	if res == "coal":
		emit_signal("update",5)


func _on_HeatArea_body_entered(body):
	emit_signal("enter")

func _on_HeatArea_body_exited(body):
	emit_signal("exit")
