extends HSlider

func initialized():
	value = 0
	$Result.text = ""
	$Guess.text = ""

func _on_HSlider_mouse_exited() -> void:
	self.release_focus()

func _physics_process(delta):
	$Guess.text = "You guessed: " + String((value * 5) + 500) + "cm"
