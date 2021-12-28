extends Node2D

var holding = false
var original_pos = Vector2()
var gen = RandomNumberGenerator.new()

func _ready():
	gen.randomize()
	position = Vector2(gen.randi_range(100,get_viewport().size.x -100),gen.randi_range(100,get_viewport().size.y -100))

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		holding = true
		get_tree().set_input_as_handled()
		original_pos = event.position

func _input(event):
	if not holding:
		return
	
	if event.is_action_released("click"):
		original_pos = Vector2()
		holding = false
	
	if holding && event is InputEventMouseMotion:
		position += event.position - original_pos
		original_pos = event.position
