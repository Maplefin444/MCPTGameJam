extends Area2D

var inside = false
var alr = false
signal upgrade1_pressed

func _input(event):
	if Input.is_action_just_pressed("interact") && inside && not alr:
		alr = true
		$CanvasLayer/Controller.visible = true

func _on_House_body_entered(body):
	inside = true
	$Notif.visible = true


func _on_House_body_exited(body):
	inside = false
	$Notif.visible = false


func _on_TextureButton_pressed():
	$CanvasLayer/Controller.visible = false
	alr = false


func _on_Button_pressed():
	emit_signal("upgrade1_pressed")


func _on_GUI_poor():
	$CanvasLayer/Controller/PoorNotif.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$CanvasLayer/Controller/PoorNotif.visible = false
