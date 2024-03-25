extends Area2D
class_name Bullet

var SPEED: float = 200
var should_start_moving: bool = false
var target_location: Vector2

func _ready() -> void:
	print("bullet ready")
	body_entered.connect(on_hit)


func _process(delta: float) -> void:
	if should_start_moving:
		var direction = target_location - global_position
		translate(direction.normalized() * SPEED * delta)

func fly_to(location: Vector2):
	look_at(location)
	should_start_moving = true
	target_location = location

func on_hit(body: Node2D):
	print("hit by %s", body.name)
	hide()
	should_start_moving = false
	collision_layer = 0x00
	collision_mask = 0x00
	queue_free()
