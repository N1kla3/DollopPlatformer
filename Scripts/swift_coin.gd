@tool
extends Coin
class_name SwiftCoin


@export var additional_movespeed : int

func apply_sphere(character : Platform_character) -> void:
	character.attributes_node.instant_effect(AttributeSet.attribute_type.SPEED, additional_movespeed)

func _ready() -> void:
	super()
