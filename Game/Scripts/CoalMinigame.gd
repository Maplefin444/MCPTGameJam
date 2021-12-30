extends CanvasLayer

var off = true
var draggableItem = preload("res://Scenes/DraggableItem.tscn")
onready var a1 = get_node("Controller/3")
onready var a2 = get_node("Controller/7")
onready var a3 = get_node("Controller/6")
onready var a4 = get_node("Controller/4")
onready var holder = Node2D.new()
signal cont
signal done(res)

var sent = false
var object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]



func _physics_process(delta):
	if off:
		return
	
	var count1 = 0
	var count2 = 0
	var count3 = 0
	var count4 = 0
	
	for i in range(20):
		if object_arr[i].overlaps_area(a1):
			count1 +=1
		elif object_arr[i].overlaps_area(a2):
			count2 +=1
		elif object_arr[i].overlaps_area(a3):
			count3 +=1
		elif object_arr[i].overlaps_area(a4):
			count4 +=1
	
	
	if count1 == 3 and count2 == 7 and count3 == 6 and count4 == 4:
		$Controller/Label2.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
		if not sent:
			sent = true
			emit_signal("done")
			emit_signal("cont") 
		$Controller.visible = false
		if holder != null:
			remove_child(holder)


func _on_Button_pressed():
	if off:
		return
	emit_signal("cont")
	$Controller.visible = false
	holder.visible = false
	holder.queue_free()
	off = true


func _on_CoalMinigameNode_lock():
	holder = Node2D.new()
	$Controller.add_child(holder)
	holder.visible = true
	object_arr = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
	for i in range(20):
		object_arr[i] = draggableItem.instance()
		holder.add_child(object_arr[i])
		object_arr[i].visible = true
	off = false



