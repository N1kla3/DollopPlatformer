extends Area2D

class_name Coin

var score_value : int = 10
@export var animation : SpriteFrames

func _ready() -> void:
	body_entered.connect(on_body_entered)
	%AnimatedSprite2D.sprite_frames = animation	

func on_body_entered(body: Node2D):
	print("body entered", body.name)
