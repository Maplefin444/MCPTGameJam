extends CanvasLayer

signal update(num)

signal enter
signal exit

signal updatewood(num)
signal updatecloth(num)

signal upgrade1

signal poor

signal dead



func _on_HeatArea_body_entered(body):
	emit_signal("enter")

func _on_HeatArea_body_exited(body):
	emit_signal("exit")


func _on_House_upgrade1_pressed():
	if $CoalLabel.value >= 5:
		$CoalLabel.value -= 5
		emit_signal("upgrade1")
	else:
		emit_signal("poor")


func _on_WoodMinigameNode_finished(tf,val):
	if tf:
		emit_signal("updatewood",val)


func _on_HeatMeter_dead():
	emit_signal("dead")


func _on_CoalMinigameNode_finished(res):
	if res == "coal":
		emit_signal("update",10)




func _on_ClothMinigameNode_completed(tf,val):
	if tf:
		emit_signal("updatecloth",val)
