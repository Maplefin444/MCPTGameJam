extends HSlider



func _on_HSlider_mouse_exited() -> void:
	self.release_focus()

func _physics_process(delta):
	$Guess.text = "You guessed: " + String((value * 1.2) + 240)
