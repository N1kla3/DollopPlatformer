extends Area2D

class_name Coin

var score_value : int = 10
@export var animation : SpriteFrames

func _ready() -> void:
	body_entered.connect(on_body_entered)
	%AnimatedSprite2D.sprite_frames = animation	
	%AnimatedSprite2D.play("Flip")

func on_body_entered(body: Node2D):
	print("body entered", body.name)
	var temp = body as Platform_character
	if temp:
		temp.score += 110
	hide()
	collision_layer = 0x00
	collision_mask = 0x00
	queue_free()
	
