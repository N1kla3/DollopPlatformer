@tool
extends Coin

class_name LifeSphere

@export var heal : int

func apply_sphere(character : Platform_character) -> void:
	character.health += 25;

func _ready() -> void:
	body_entered.connect(on_body_entered)
	%AnimatedSprite2D.sprite_frames = animation	
	%AnimatedSprite2D.play(animation_name)
	var temp_shape = $CollisionShape2D.shape as RectangleShape2D
	if temp_shape:
		temp_shape.size.x = collision_size;
		temp_shape.size.y = collision_size;
