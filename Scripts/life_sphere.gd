@tool
extends Coin

class_name LifeSphere

@export var heal : int

func apply_sphere(character : Platform_character) -> void:
	character.health += heal;

func _ready() -> void:
	super()
