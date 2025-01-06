@tool
extends Area2D

class_name Coin


const animation_name = "Idle"
@export var score_value : int = 10
@export var animation : SpriteFrames:
	set (new_sprites):
		animation = new_sprites
		if Engine.is_editor_hint() && $AnimatedSprite2D:
			$AnimatedSprite2D.sprite_frames = new_sprites
			$AnimatedSprite2D.play(animation_name)

@export var collision_size : int :
	set (new_size):
		collision_size = new_size
		if Engine.is_editor_hint() && $CollisionShape2D:
			var temp_shape = $CollisionShape2D.shape as RectangleShape2D
			temp_shape.size.x = new_size;
			temp_shape.size.y = new_size;
			

func _ready() -> void:
	body_entered.connect(on_body_entered)
	%AnimatedSprite2D.sprite_frames = animation	
	%AnimatedSprite2D.play(animation_name)
	var temp_shape = $CollisionShape2D.shape as RectangleShape2D
	temp_shape.size.x = collision_size;
	temp_shape.size.y = collision_size;

func on_body_entered(body: Node2D):
	print("body entered", body.name)
	var temp = body as Platform_character
	if temp:
		temp.score += score_value
		hide()
		collision_layer = 0x00
		collision_mask = 0x00
		queue_free()
	
