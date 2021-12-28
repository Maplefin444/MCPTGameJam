extends Area2D

var inside = false
var alr = false

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
