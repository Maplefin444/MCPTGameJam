extends Node2D


func _on_TextureButton_pressed():
	$TextureButton.disabled = true
	SceneChange.change_scene("res://Scenes/Instructions.tscn")
 
