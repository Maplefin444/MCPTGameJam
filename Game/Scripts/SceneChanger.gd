extends CanvasLayer

signal scene_changed()

onready var animplayer = $AnimationPlayer
onready var colour = $Control/ColorRect

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animplayer.play("Fade")
	yield(animplayer, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animplayer.play_backwards("Fade")
	yield(animplayer, "animation_finished")
	emit_signal("scene_changed")
