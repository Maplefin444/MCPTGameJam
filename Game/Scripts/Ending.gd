extends Node2D

func _ready():
	var dia = Dialogic.start("Ending")
	add_child(dia)
	yield(dia, "dialogic_signal")
	yield(get_tree().create_timer(4), "timeout")
	SceneChange.change_scene("res://Scenes/MainMenu.tscn")
