extends Area2D

signal wood_picked
var inrange = false

func _on_Wood_body_entered(body):
	inrange = true
	$Notif.visible = true


func _on_Wood_body_exited(body):
	inrange = false
	$Notif.visible = false


func _on_Wood_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && inrange:
		connect("wood_picked",get_parent().get_parent().get_node("GUI"),"_on_Wood_wood_picked")
		emit_signal("wood_picked")
		queue_free()

