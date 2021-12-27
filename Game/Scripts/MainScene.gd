extends Node2D

func _draw():
	for n in range($Holder.points.size()):
		draw_circle($Holder.points[n], 30, Color(1,1,1))
