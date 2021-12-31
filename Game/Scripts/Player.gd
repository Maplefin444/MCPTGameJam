extends ColorRect

func _physics_process(delta):
	set_position(Vector2((get_parent().playerpos.x/75)+50,(get_parent().playerpos.y/75)+50))
