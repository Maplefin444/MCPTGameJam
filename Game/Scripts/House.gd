extends Area2D

var inside = false
var alr = false
signal upgrade1_pressed
signal upgrade2_pressed
signal upgrade3_pressed
signal lock
signal unlock

var upgrade1 = 1
var upgrade2 = 1
var upgrade3 = 1

func _physics_process(delta):
	$CanvasLayer/Controller/Label.text = String(upgrade1*5) + " Coal - Torch Upgrade (Delays Heat Decay)"
	$CanvasLayer/Controller/Label2.text = String(upgrade2*5) + " Wood - Campfire Upgrade (Heat Meter Increase)"
	$CanvasLayer/Controller/Label3.text = String(upgrade3*5) + " Cloth - Coat Upgrade (Reduces Heat Decay)"

func _input(event):
	if Input.is_action_just_pressed("interact") && inside && not alr:
		alr = true
		$CanvasLayer/Controller.visible = true
		emit_signal("lock")

func _on_House_body_entered(body):
	if body is StaticBody2D:
		pass
	else:
		inside = true
		$Notif.visible = true


func _on_House_body_exited(body):
	if body is StaticBody2D:
		pass
	else:
		inside = false
		$Notif.visible = false


func _on_TextureButton_pressed():
	$CanvasLayer/Controller.visible = false
	alr = false
	emit_signal("unlock")



func _on_GUI_poor():
	$CanvasLayer/Controller/PoorNotif.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$CanvasLayer/Controller/PoorNotif.visible = false


func _on_BuyButton1_pressed():
	emit_signal("upgrade1_pressed")


func _on_BuyButton2_pressed():
	emit_signal("upgrade2_pressed")


func _on_BuyButton3_pressed():
	emit_signal("upgrade3_pressed")


func _on_GUI_upgrade1():
	upgrade1 +=1


func _on_GUI_upgrade2():
	upgrade2 +=1


func _on_GUI_upgrade3():
	upgrade3 +=1
