extends Area2D

signal cloth_picked
var inrange = false

func _on_Cloth_body_entered(body):
	inrange = true
	$Notif.visible = true


func _on_Cloth_body_exited(body):
	inrange = false
	$Notif.visible = false


func _on_Cloth_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") && inrange:
		connect("cloth_picked",get_parent().get_parent().get_node("GUI"),"_on_Cloth_cloth_picked")
		emit_signal("cloth_picked")
		queue_free()
