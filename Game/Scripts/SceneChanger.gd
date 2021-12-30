extends CanvasLayer

signal scene_changed()
var go

onready var animplayer = $AnimationPlayer
onready var colour = $Control/ColorRect

func change_scene(path, delay = 0):
	yield(get_tree().create_timer(delay), "timeout")
	animplayer.play("Fade")
	yield(animplayer, "animation_finished")
	if path is Array:
		go = path[0]
	else:
		go = path
	assert(get_tree().change_scene(go) == OK)
	animplayer.play_backwards("Fade")
	yield(animplayer, "animation_finished")
	emit_signal("scene_changed")
