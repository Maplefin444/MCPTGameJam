extends Area2D

var inside = false
var speaking = false
signal lock
signal unlock
onready var controller = $CoalMinigame/Controller

func _on_CoalMinigameNode_body_entered(body):
	inside = true
	$Notif.visible = true


func _on_CoalMinigameNode_body_exited(body):
	inside = false
	$Notif.visible = false
	
func _input(event):
	if Input.is_action_just_pressed("interact") && inside:
		controller.visible = true
		emit_signal("lock")


func _on_CoalMinigame_cont():
	emit_signal("unlock")
