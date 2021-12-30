extends Area2D

signal start

signal finished(tf,val)

signal lock
signal unlock

var inside = false
var running = false

var completed = false

func _ready():
	connect("finished",get_parent().get_parent().get_node("GUI"),"_on_WoodMinigameNode_finished")
	connect("lock",get_parent().get_parent().get_node("Player"),"_on_lock")
	connect("unlock",get_parent().get_parent().get_node("Player"),"_on_unlock")

func _on_WoodMinigameNode_body_entered(body):
	if completed:
		return
	elif body is TileMap:
		return
	elif body is KinematicBody2D:
		inside = true
		$Notif.visible = true


func _on_WoodMinigameNode_body_exited(body):
	if body is StaticBody2D:
		return
	elif body is TileMap:
		return
	elif body is KinematicBody2D:
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
	if tf:
		completed = true
	running = false
	emit_signal("unlock")
	emit_signal("finished", tf,10)
