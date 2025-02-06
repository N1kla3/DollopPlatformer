extends RigidBody2D

class_name Ball


func _ready() -> void:
	body_entered.connect(on_collision)

func on_collision(body : Node):
	print(body.name)
