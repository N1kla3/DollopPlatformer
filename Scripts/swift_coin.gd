@tool
extends Coin
class_name SwiftCoin


@export var additional_movespeed : int

func apply_sphere(character : Platform_character) -> void:
	character.speed_comp.addSpeed(additional_movespeed)

func _ready() -> void:
	super()
