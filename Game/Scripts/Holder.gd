extends Node2D

var holding = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		holding = true
	else:
		holding = false

func _physics_process(delta):
	if holding:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
