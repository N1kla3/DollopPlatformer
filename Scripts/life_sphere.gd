@tool
extends Coin

class_name LifeSphere

@export var heal : int

func apply_sphere(character : Platform_character) -> void:
	character.attributes_node.instant_effect(AttributeSet.attribute_type.HEALTH, heal)

func _ready() -> void:
	super()
