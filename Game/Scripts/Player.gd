extends ColorRect

func _physics_process(delta):
	set_position(Vector2((get_parent().get_parent().playerpos.x/75)+50,(get_parent().get_parent().playerpos.y/75)+50))
	if get_position().x > 106 or get_position().y > 106 or get_position().x < 0 or get_position().y < 0:
		visible = false
	else:
		visible = true
