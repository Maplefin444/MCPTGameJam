extends CanvasLayer

var rangee = 10

signal finished(tf)
var off = false

func _on_ChopButton_pressed():
	if off:
		return
	if $Controller/Tree.num-rangee <= ($Controller/HSlider.value*1.2)+240 && ($Controller/HSlider.value*1.2)+240 <= $Controller/Tree.num+rangee:
		$Controller/HSlider/Result.text = "Correct!"
		yield(get_tree().create_timer(0.5),"timeout")
		emit_signal("finished",true)
		off = true
		$Controller.visible = false
	elif ($Controller/HSlider.value*1.2)+240 > $Controller/Tree.num:
		$Controller/HSlider/Result.text = "Your guess is too high"
	elif ($Controller/HSlider.value*1.2)+240 < $Controller/Tree.num:
		$Controller/HSlider/Result.text = "Your guess is too low"


func _on_XButton_pressed():
	emit_signal("finished",false)
	off = true
	$Controller.visible = false


func _on_ClothMinigameNode_start():
	$Controller/Tree.initialized()
	off = false
	$Controller.visible = true
