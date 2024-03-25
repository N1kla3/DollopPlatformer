extends StaticBody2D

@export var Speed: float = 200
@export var ChangeDirectionTime: float = 1

var temp_time: float = 0
var temp_direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	temp_time += delta
	var temp_velocity = Vector2(0, temp_direction * Speed * delta);
	translate(temp_velocity)
	if temp_time >= ChangeDirectionTime:
		temp_direction = -temp_direction
		temp_time = 0
