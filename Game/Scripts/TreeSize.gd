extends Sprite



var rng = RandomNumberGenerator.new()
var s = 0

func _ready():
	rng.randomize()
	s = rng.randi_range(10, 20) / 100.0

	var size = texture.get_size()
	self.set_scale(Vector2(s, s))
	var bX = 0.2 * size[0] - s * size[0]
	bX /= 2
	var bY = 0.2 * size[1] - s * size[1]
	bY /= 2
	self.set_position(Vector2(220 + bX, 270 + bY))
	print(texture.get_size())
