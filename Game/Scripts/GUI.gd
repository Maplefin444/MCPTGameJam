extends CanvasLayer


signal enter
signal exit

signal updatecoal(num)
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
	print("recieved")
	if tf:
		emit_signal("updatewood",val)


func _on_HeatMeter_dead():
	emit_signal("dead")


func _on_CoalMinigameNode_finished(res):
	if res == "coal":
		emit_signal("updatecoal",10)




func _on_ClothMinigameNode_completed(tf,val):
	if tf:
		emit_signal("updatecloth",val)


func _on_Coal_coal_picked():
	emit_signal("updatecoal",1)


func _on_Wood_wood_picked():
	emit_signal("updatewood",1)

func _on_Cloth_cloth_picked():
	emit_signal("updatecloth",1)

func _on_CoalStack_coal_picked():
	emit_signal("updatecoal",3)


func _on_WoodStack_wood_picked():
	emit_signal("updatewood",3)
