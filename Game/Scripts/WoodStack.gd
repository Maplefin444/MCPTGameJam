extends Area2D

signal woodstack_picked
var inrange = false

func _on_WoodStack_body_entered(body):
	inrange = true
	$Notif.visible = true


func _on_WoodStack_body_exited(body):
	inrange = false
	$Notif.visible = false


func _on_WoodStack_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && inrange:
		connect("woodstack_picked", get_parent().get_parent().get_node("GUI"),"_on_WoodStack_wood_picked")
		emit_signal("woodstack_picked")
		queue_free()
