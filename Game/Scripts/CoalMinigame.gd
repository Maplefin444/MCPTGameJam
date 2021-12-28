extends CanvasLayer

var draggableItem = preload("res://Scenes/DraggableItem.tscn")
onready var a1 = get_node("Controller/3")
onready var a2 = get_node("Controller/7")
onready var a3 = get_node("Controller/6")
onready var a4 = get_node("Controller/4")
signal cont
var object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]

func _ready():
	for i in range(20):
		object_arr[i] = draggableItem.instance()
		object_arr[i] .visible = false
		add_child(object_arr[i] )

func _physics_process(delta):
	if len(a1.get_overlapping_areas()) == 3 && len(a2.get_overlapping_areas()) == 7 && len(a3.get_overlapping_areas()) == 6 && len(a4.get_overlapping_areas()) == 4:
		print("win")


func _on_Button_pressed():
	emit_signal("cont")
	$Controller.visible = false
	for i in range(20):
		object_arr[i].visible = false


func _on_CoalMinigameNode_lock():
	for i in range(20):
		object_arr[i].visible = true
