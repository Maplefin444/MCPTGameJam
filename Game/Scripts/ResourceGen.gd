extends Node2D


var gen = RandomNumberGenerator.new()

func generate(holder, piece, x1, y1, x2, y2, ct):
	for i in range(ct):
		var curr = piece.duplicate()
		gen.randomize()
		var pos = Transform2D(0, Vector2(gen.randi_range(x1, x2),gen.randi_range(y1, y2)))
		curr.set_transform(pos)
		holder.add_child(curr)


func _ready():
	# top half
	generate($"Coal Pieces", $"Coal Pieces/Coal", -1500, -3000, 2000, -1000, 15)
	generate($"Coal Stacks", $"Coal Stacks/CoalStack", -1500, -3000, 2000, -1000, 5)
	generate($"Wood Pieces", $"Wood Pieces/Wood", -1500, -3000, 2000, -1000, 15)
	generate($"Wood Stacks", $"Wood Stacks/WoodStack", -1500, -3000, 2000, -1000, 5)
	
	# bottom half
	generate($"Coal Pieces", $"Coal Pieces/Coal", -2000, 1000, 2000, 2500, 15)
	generate($"Coal Stacks", $"Coal Stacks/CoalStack", -2000, 1000, 2000, 2500, 5)
	generate($"Wood Pieces", $"Wood Pieces/Wood", -2000, 1000, 2000, 2500, 15)
	generate($"Wood Stacks", $"Wood Stacks/WoodStack", -2000, 1000, 2000, 2500, 5)

	# cloth
	generate($"Cloth Pieces", $"Cloth Pieces/Cloth", -1500, -3000, 2500, 2000, 10)
	
	# top games
	generate($"Coal Minigames", $"Coal Minigames/CoalMinigameNode", -1500, -3000, 2000, -1000, 4)
	generate($"Wood Minigames", $"Wood Minigames/WoodMinigameNode", -1500, -3000, 2000, -1000, 4)
	generate($"Cloth Minigames", $"Cloth Minigames/ClothMinigameNode", -1500, -3000, 2000, -1000, 2)
	
	# bottom games
	generate($"Coal Minigames", $"Coal Minigames/CoalMinigameNode", -2000, 1000, 2000, 2500, 4)
	generate($"Wood Minigames", $"Wood Minigames/WoodMinigameNode", -2000, 1000, 2000, 2500, 4)
	generate($"Cloth Minigames", $"Cloth Minigames/ClothMinigameNode", -2000, 1000, 2000, 2500, 2)


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		SceneChange.change_scene("res://Scenes/Ending.tscn")
