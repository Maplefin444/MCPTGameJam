extends Area2D

var inside = false
var speaking = false
var ingame = false
var completed = false
signal lock
signal unlock
signal finished
onready var controller = $CoalMinigame/Controller

func _on_CoalMinigameNode_body_entered(body):
	if body is StaticBody2D:
		pass
	else:
		inside = true
		if completed:
			return
		$Notif.visible = true


func _on_CoalMinigameNode_body_exited(body):
	if body is StaticBody2D:
		pass
	else:
		inside = false
		$Notif.visible = false
		if completed:
			return

func _input(event):
	if completed:
		return
	if Input.is_action_just_pressed("interact") && inside && not ingame:
		controller.visible = true
		emit_signal("lock")
		ingame = true


func _on_CoalMinigame_cont():
	emit_signal("unlock")
	ingame = false


func _on_CoalMinigame_done():
	completed = true
	emit_signal("finished", "coal")
	ingame = false
