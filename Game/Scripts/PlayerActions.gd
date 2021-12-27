extends KinematicBody2D

var speed : int = 200
var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x = -speed
	if Input.is_action_pressed("move_right"):
		vel.x = speed
	if Input.is_action_pressed("move_up"):
		vel.y = -speed
	if Input.is_action_pressed("move_down"):
		vel.y = speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false




