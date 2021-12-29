extends HSlider


func _on_HSlider_mouse_exited() -> void:
	self.release_focus()

