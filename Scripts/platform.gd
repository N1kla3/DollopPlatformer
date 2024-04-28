extends StaticBody2D

@export var Speed: float = 50
@export var PercSpeed: float = 10
@export var UsePercentageSpeed = false
@export var InvertStartingDirection = false

var path : PathFollow2D
var path_is_loop: bool

func _ready() -> void:
	path = get_parent() as PathFollow2D
	if path:
		path_is_loop = path.loop
		if InvertStartingDirection:
			Speed *= -1
			PercSpeed *= -1


func _process(delta: float) -> void:
	if path:
		if UsePercentageSpeed:
			var change = PercSpeed * delta
			path.progress_ratio += change
		else:
			var change = Speed * delta
			path.progress += change
