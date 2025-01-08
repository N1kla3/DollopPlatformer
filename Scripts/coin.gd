@tool
extends Area2D

class_name Coin


const animation_name = "Idle"
@onready var animation_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape : CollisionShape2D = $CollisionShape2D
@export var score_value : int = 10
@export var animation : SpriteFrames:
	set (new_sprites):
		print("set animation coin")
		animation = new_sprites
		if Engine.is_editor_hint() && animation_sprite:
			animation_sprite.sprite_frames = new_sprites
			animation_sprite.play(animation_name)

@export var collision_size : int :
	set (new_size):
		print("set collision size coin")
		collision_size = new_size
		if Engine.is_editor_hint() && collision_shape:
			var temp_shape = collision_shape.shape as RectangleShape2D
			if temp_shape:
				temp_shape.size.x = new_size;
				temp_shape.size.y = new_size;
			

func _ready() -> void:
	print("ready coin")
	body_entered.connect(on_body_entered)
	animation_sprite.sprite_frames = animation	
	animation_sprite.play(animation_name)
	var temp_shape = collision_shape.shape as RectangleShape2D
	if temp_shape:
		temp_shape.size.x = collision_size;
		temp_shape.size.y = collision_size;

func apply_sphere(character : Platform_character) -> void:
	character.score += score_value

func on_body_entered(body: Node2D):
	print("body entered", body.name)
	var temp = body as Platform_character
	if temp:
		apply_sphere(temp)
		hide()
		collision_layer = 0x00
		collision_mask = 0x00
		queue_free()
	
