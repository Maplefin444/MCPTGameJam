extends Area2D

signal start

signal completed(tf,val)

signal lock
signal unlock

var inside = false
var running = false

var completed = false

func _ready():
	connect("completed",get_parent().get_parent().get_node("GUI"),"_on_ClothMinigameNode_completed")
	connect("lock",get_parent().get_parent().get_node("Player"),"_on_lock")
	connect("unlock",get_parent().get_parent().get_node("Player"),"_on_unlock")

func _input(event):
	if completed:
		return
	if inside && Input.is_action_just_pressed("interact") && not running:
		running = true
		emit_signal("start")
		emit_signal("lock")


func _on_TreeFallGame_finished(tf):
	if tf:
		completed = true
	emit_signal("unlock")
	running = false
	emit_signal("completed",tf,10)


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
