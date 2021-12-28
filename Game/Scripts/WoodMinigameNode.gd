extends CanvasLayer

var y = 96
var dir = true
var count = 0
var speed = 15

func _physics_process(delta):
	if dir:
		y+=speed
	else:
		y-=speed
	
	if y > get_viewport().size.y - 96:
		dir = false
	elif y < 96:
		dir = true
	$HitObject/Sprite.position = Vector2(736,y)
	$HitObject/CollisionShape2D.position = Vector2(736,y)
	if count == 3:
		print("win")

func _input(InputEvent):
	if Input.is_action_just_pressed("interact") && len($HitObject.get_overlapping_areas()) == 1:
		count += 1
		$Label.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
		$Label.visible = false
	elif Input.is_action_just_pressed("interact"):
		count = 0
