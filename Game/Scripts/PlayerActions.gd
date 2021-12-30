extends KinematicBody2D

var speed = 200
var vel = Vector2()
var locked = false
var moving = false
var running = false

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel = Vector2()
	if !locked:
		moving = false
		if Input.is_action_pressed("move_left"):
			vel.x = -speed
			moving = true
		if Input.is_action_pressed("move_right"):
			vel.x = speed
			moving = true
		if Input.is_action_pressed("move_up"):
			vel.y = -speed
			moving = true
		if Input.is_action_pressed("move_down"):
			vel.y = speed
			moving = true
		movement_anim()
		vel = move_and_slide(vel, Vector2.UP)

func movement_anim():
	if moving && not running:
		running = true
		for i in range(5):
			$Sprite.position.y -= 1
			yield(get_tree().create_timer(0.02),"timeout")
		yield(get_tree().create_timer(0.3),"timeout")
		for i in range(5):
			$Sprite.position.y += 1
			yield(get_tree().create_timer(0.02),"timeout")
		yield(get_tree().create_timer(0.3),"timeout")
		running = false


func _on_InteractionArea_lock():
	locked = true

func _on_lock():
	locked = true

func _on_unlock():
	locked = false

func _on_InteractionArea_unlock():
	locked = false

func _on_CoalMinigameNode_lock():
	locked = true

func _on_CoalMinigameNode_unlock():
	locked = false

func _on_House_lock():
	locked = true

func _on_House_unlock():
	locked = false

func _on_GUI_dead():
	print("temporary death")

	locked = false

func _on_WoodMinigameNode_lock():
	locked = true

func _on_WoodMinigameNode_unlock():
	locked = false
