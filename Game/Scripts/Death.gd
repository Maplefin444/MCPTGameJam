extends NinePatchRect




func _on_TextureButton_pressed():
	$TextureButton.disabled = true
	SceneChange.change_scene("res://Scenes/MainMenu.tscn")
