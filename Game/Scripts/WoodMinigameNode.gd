extends Area2D

signal start

signal finished(tf,val)

signal lock
signal unlock

var inside = false
var running = false

var completed = false


func _on_WoodMinigameNode_body_entered(body):
	if completed:
		return
	if body is StaticBody2D:
		pass
	else:
		inside = true
		$Notif.visible = true


func _on_WoodMinigameNode_body_exited(body):
	if body is StaticBody2D:
		pass
	else:
		$Notif.visible = false
		if completed:
			return
		inside = false

func _input(event):
	if completed:
		return
	if inside && Input.is_action_just_pressed("interact") && not running:
		running = true
		emit_signal("start")
		emit_signal("lock")


func _on_WoodMinigame_complete(tf):
	completed = true
	running = false
	emit_signal("unlock")
	emit_signal("finished", tf,10)
