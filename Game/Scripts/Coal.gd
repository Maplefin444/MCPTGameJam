extends Area2D

signal coal_picked
var inrange = false

func _on_Coal_body_entered(body):
	inrange = true
	$Notif.visible = true


func _on_Coal_body_exited(body):
	inrange = false
	$Notif.visible = false


func _on_Coal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && inrange:
		connect("coal_picked", get_parent().get_parent().get_node("GUI"),"_on_Coal_coal_picked")
		emit_signal("coal_picked")
		queue_free()
