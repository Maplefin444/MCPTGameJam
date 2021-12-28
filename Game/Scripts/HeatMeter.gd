extends ProgressBar
var heated = false
var decay = 0.1
var build = 0.5

func _ready():
	value = 100

func _physics_process(delta):
	if not heated:
		value -= decay
	elif heated:
		value += decay


func _on_GUI_enter():
	heated = true


func _on_GUI_exit():
	heated = false
