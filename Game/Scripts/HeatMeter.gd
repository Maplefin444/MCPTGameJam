extends ProgressBar
var heated = false
var decay = 0.1
var build = 0.5
var retain_level = 1
var retaining = true
var slowdown = 1

func _ready():
	value = 100

func _physics_process(delta):
	if retaining:
		yield(get_tree().create_timer(retain_level*3),"timeout")
		retaining = false
	if not heated && not retaining:
		slowdown += 0.001
		value -= decay/slowdown
	elif heated:
		value += decay


func _on_GUI_enter():
	heated = true
	slowdown = 1


func _on_GUI_exit():
	heated = false
	retaining = true
