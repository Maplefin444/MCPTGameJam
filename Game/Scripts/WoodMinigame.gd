extends CanvasLayer

var y = 300
var dir = true
var count = 0
var speed = 15
signal complete(tf)
var off = true

func _physics_process(delta):
	if off:
		return
	if dir:
		y+=speed
	else:
		y-=speed
	
	if y > get_viewport().size.x - 305:
		dir = false
	elif y < 300:
		dir = true
	$Controller/HitObject/CollisionShape2D.position = Vector2(y,303)
	if count == 3:
		emit_signal("complete",true)
		yield(get_tree().create_timer(0.5), "timeout")
		$Controller.visible = false
		off = true

func _input(InputEvent):
	if off:
		return
	if Input.is_action_just_pressed("interact") && $Controller/HitObject.overlaps_area($Controller/HitArea):
		count += 1
		$Controller/Label.text = "HIT x" + String(count)
		$Controller/Label.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
		$Controller/Label.visible = false
	elif Input.is_action_just_pressed("interact"):
		count = 0
		$Controller/Label.text = "MISS"
		$Controller/Label.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
		$Controller/Label.visible = false


func _on_TextureButton_pressed():
	emit_signal("complete",false)
	$Controller.visible = false
	off = true


func _on_WoodMinigameNode_start():
	$Controller.visible = true
	off = false

