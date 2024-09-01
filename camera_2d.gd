extends Camera2D

var x: float = 1.0
var y: float = 1.0

func _ready():
	set_zoom(Vector2(x, y))
