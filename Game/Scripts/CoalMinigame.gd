extends CanvasLayer

var draggableItem = preload("res://Scenes/DraggableItem.tscn")

func _ready():
	for i in range(20):
		var item = draggableItem.instance()
		add_child(item)

