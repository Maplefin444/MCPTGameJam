extends TextureProgress

var heated = false
var decay = 0.07
var build = 0.5
var retain_level = 1
var retaining = true
var speedup = 0

func _ready():
	value = 100

func _physics_process(delta):
	if retaining:
		yield(get_tree().create_timer(retain_level*3),"timeout")
		retaining = false
	if not heated && not retaining:
		value -= decay
	elif heated:
		speedup += 0.005
		value += speedup
	print(value)


func _on_GUI_enter():
	heated = true
	speedup = 0


func _on_GUI_exit():
	heated = false
	retaining = true
