extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Object initialized')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = 100
	if Input.is_action_pressed('move_up'):
		translate(delta * Vector2(0, -speed))
	if Input.is_action_pressed('move_down'):
		translate(delta * Vector2(0, speed))
	if Input.is_action_pressed('move_left'):
		translate(delta * Vector2(-speed, 0))
	if Input.is_action_pressed('move_right'):
		translate(delta * Vector2(speed, 0))


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
