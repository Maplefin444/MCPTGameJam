extends Area2D

var inside = false
var speaking = false
signal lock
signal unlock

func _on_InteractionArea_body_entered(body):
	inside = true
	$Notif.visible = true

func _on_InteractionArea_body_exited(body):
	inside = false
	$Notif.visible = false

func _input(event):
	if Input.is_action_just_pressed("interact") && inside && !speaking:
		speaking = true
		emit_signal("lock")
		var dialogue = Dialogic.start('Test')
		add_child(dialogue)
		yield(dialogue, "dialogic_signal")
		yield(get_tree().create_timer(0.2),"timeout")
		speaking = false
		emit_signal("unlock")
