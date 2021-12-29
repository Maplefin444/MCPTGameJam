extends CanvasLayer

var off = true
var draggableItem = preload("res://Scenes/DraggableItem.tscn")
onready var a1 = get_node("Controller/3")
onready var a2 = get_node("Controller/7")
onready var a3 = get_node("Controller/6")
onready var a4 = get_node("Controller/4")
signal cont
signal done(res)
var object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]



func _physics_process(delta):
	if off:
		return
	
	if len(a1.get_overlapping_areas()) == 4 and len(a2.get_overlapping_areas()) == 8 and len(a3.get_overlapping_areas()) == 7 and len(a4.get_overlapping_areas()) == 5:
		emit_signal("done")
		emit_signal("cont")
		$Controller.visible = false
		for i in range(20):
			object_arr[i].visible = false
			remove_child(object_arr[i])


func _on_Button_pressed():
	if off:
		return
	emit_signal("cont")
	$Controller.visible = false
	for i in range(20):
		object_arr[i].visible = false
		object_arr[i].queue_free()
	off = true


func _on_CoalMinigameNode_lock():
	object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
	for i in range(20):
		object_arr[i] = draggableItem.instance()
		object_arr[i] .visible = true
		add_child(object_arr[i])
	off = false



