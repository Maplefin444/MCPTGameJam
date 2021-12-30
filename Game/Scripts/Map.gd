extends Node2D



func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		SceneChange.change_scene("res://Scenes/Ending.tscn")
