extends NinePatchRect





func _on_TextureButton_pressed():
	visible = !visible

func _physics_process(delta):
	$Label.text = "Heat Retension: " + String(get_parent().get_node("HeatMeter").upgrade1) + "\nHeat Limit: " + String(get_parent().get_node("HeatMeter").upgrade2) + "\nHeat Decay: " + String(get_parent().get_node("HeatMeter").upgrade3)


func _on_ExitButton_pressed():
	SceneChange.change_scene("res://Scenes/MainMenu.tscn")
