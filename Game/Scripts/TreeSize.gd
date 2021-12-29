extends Sprite



var rng = RandomNumberGenerator.new()
var s = 0
var num = 0

func initialized():
	rng.randomize()
	s = rng.randi_range(10, 15) / 100.0

	var size = texture.get_size()
	self.set_scale(Vector2(s, s))
	var bX = 0.2 * size[0] - s * size[0]
	bX /= 2
	var bY = 0.2 * size[1] - s * size[1]
	bY /= 2
	self.set_position(Vector2(200 + bX, 230 + bY))
	num = texture.get_size().y * s
	print(num)
