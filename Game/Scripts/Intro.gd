extends Node2D


func _ready():
	var introdia = Dialogic.start("Intro")
	add_child(introdia)
	yield(introdia, "dialogic_signal")
	$house.visible = false
	$outside.visible = true
