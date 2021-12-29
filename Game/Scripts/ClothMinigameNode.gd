extends Area2D

signal start

signal completed(tf)

var inside = false
var running = false

var completed = false

func _input(event):
	if completed:
		return
	if inside && Input.is_action_just_pressed("interact") && not running:
		running = true
		emit_signal("start")


func _on_TreeFallGame_finished(tf):
	if tf:
		completed = true
	running = false
	emit_signal("completed",tf)


func _on_ClothMinigameNode_body_entered(body):
	if completed:
		return
	if body is StaticBody2D:
		pass
	else:
		inside = true
		$Notif.visible = true


func _on_ClothMinigameNode_body_exited(body):
	if body is StaticBody2D:
		pass
	else:
		$Notif.visible = false
		if completed:
			return
		inside = false
