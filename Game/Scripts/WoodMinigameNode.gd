extends CanvasLayer

var y = 96
var dir = true

func _physics_process(delta):
	if dir:
		y+=5
	else:
		y-=5
	
	if y > get_viewport().size.y - 96:
		dir = false
	elif y < 96:
		dir = true
	$HitObject/Sprite.position = Vector2(736,y)
	$HitObject/CollisionShape2D.position = Vector2(736,y)

func _input(InputEvent):
	if Input.is_action_just_pressed("interact") && len($HitObject.get_overlapping_areas()) == 1:
		print("wow")
	elif Input.is_action_just_pressed("interact"):
		print("cringe")
