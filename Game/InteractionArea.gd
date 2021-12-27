extends Area2D

var inside = false

func _on_InteractionArea_body_entered(body):
	inside = true
	$Notif.visible = true

func _on_InteractionArea_body_exited(body):
	inside = false
	$Notif.visible = false

func _input(event):
	if Input.is_action_just_pressed("interact") && inside:
		print("hello!")
