extends KinematicBody2D

var speed = 200
var vel = Vector2()
var locked = false

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel = Vector2()
	if !locked:
		if Input.is_action_pressed("move_left"):
			vel.x = -speed
		if Input.is_action_pressed("move_right"):
			vel.x = speed
		if Input.is_action_pressed("move_up"):
			vel.y = -speed
		if Input.is_action_pressed("move_down"):
			vel.y = speed
		vel = move_and_slide(vel, Vector2.UP)

func _on_InteractionArea_lock():
	locked = true


func _on_InteractionArea_unlock():
	locked = false


func _on_CoalMinigameNode_lock():
	locked = true


func _on_CoalMinigameNode_unlock():
	locked = false

