extends Node2D

var holding = false
var latest_point = Vector2(10,10)
var points = [Vector2(100,100), Vector2(100,500)]

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		holding = true
	else:
		holding = false

func _physics_process(delta):
	var lowestdist = 1000000
	for n in range(points.size()):
		if global_position.distance_to(points[n]) < lowestdist:
			latest_point = points[n]
			lowestdist = global_position.distance_to(points[n])
	if holding:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, latest_point, 10 * delta)
