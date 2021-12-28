extends CanvasLayer

var draggableItem = preload("res://Scenes/DraggableItem.tscn")
onready var a1 = get_node("Controller/3")
onready var a2 = get_node("Controller/7")
onready var a3 = get_node("Controller/6")
onready var a4 = get_node("Controller/4")
signal cont
signal done(res)
var object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]



func _physics_process(delta):
	if len(a1.get_overlapping_areas()) == 3 && len(a2.get_overlapping_areas()) == 7 && len(a3.get_overlapping_areas()) == 6 && len(a4.get_overlapping_areas()) == 4:
		emit_signal("done")
		emit_signal("cont")
		$Controller.visible = false
		for i in range(20):
			object_arr[i].visible = false
			object_arr[i].queue_free()


func _on_Button_pressed():
	emit_signal("cont")
	$Controller.visible = false
	for i in range(20):
		object_arr[i].visible = false
		object_arr[i].queue_free()


func _on_CoalMinigameNode_lock():
	for i in range(20):
		object_arr[i] = draggableItem.instance()
		object_arr[i] .visible = true
		add_child(object_arr[i])



