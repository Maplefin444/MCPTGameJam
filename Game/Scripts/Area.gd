extends Area2D

var inside = false
var speaking = false
var ingame = false
signal lock
signal unlock
signal finished
onready var controller = $CoalMinigame/Controller

func _on_CoalMinigameNode_body_entered(body):
	inside = true
	$Notif.visible = true


func _on_CoalMinigameNode_body_exited(body):
	inside = false
	$Notif.visible = false
	
func _input(event):
	if Input.is_action_just_pressed("interact") && inside && not ingame:
		controller.visible = true
		emit_signal("lock")
		ingame = true


func _on_CoalMinigame_cont():
	emit_signal("unlock")
	ingame = false


func _on_CoalMinigame_done():
	emit_signal("finished", "coal")
	ingame = false
