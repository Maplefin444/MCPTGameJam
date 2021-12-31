extends NinePatchRect

var playerpos = Vector2()

func _physics_process(delta):
	playerpos = get_parent().playerpos
