extends Node

class_name AttributeSet


enum attribute_type {
	HEALTH,
	MAX_HEALTH,
	SPEED,
	MAX_SPEED,
	DAMAGE
}

class effect:
	var id : int
	var type : attribute_type
	var value : int
	var addition : bool
	var duration : float


@export var data : AttributeAsset

var attributes : Dictionary[attribute_type, int]
var effects : Array[effect]

signal health_changed(old_value, new_value)
signal max_health_changed(old_value, new_value)
signal speed_changed(old_value, new_value)
signal max_speed_changed(old_value, new_value)
signal damage_changed(old_value, new_value)

func _ready() -> void:
	pass # Replace with function body.

func init_with_asset(asset : AttributeAsset):
	attributes.get_or_add(attribute_type.HEALTH, asset.health)
	attributes.get_or_add(attribute_type.MAX_HEALTH, asset.max_health)
	attributes.get_or_add(attribute_type.SPEED, asset.speed)
	attributes.get_or_add(attribute_type.MAX_SPEED, asset.max_speed)
	attributes.get_or_add(attribute_type.DAMAGE, asset.damage)

static var unique_id = 0

func add_effect(type : attribute_type, value : int, bAdd : bool, duration : float) -> int:
	unique_id += 1
	return unique_id

func remove_effect(id : int):
	var ef = effects.get(id)
	if is_instance_valid(ef):
		if ef.addition:
			attributes[ef.type] += ef.value
	broadcast_signal(ef.type, 0, ef.value)
	effects.remove_at(id)

func _process(delta : float):
	var ids : Array[int]
	for eff in effects:
		eff.duration -= delta
		if (eff.duration < 0):
			ids.append(eff.id)
	for id in ids:
		remove_effect(id)


func broadcast_signal(type : attribute_type, old : int, new_value : int):
	match type:
		attribute_type.HEALTH:
			health_changed.emit(old, new_value)
		attribute_type.MAX_HEALTH:
			max_health_changed.emit(old, new_value)
		attribute_type.SPEED:
			speed_changed.emit(old, new_value)
		attribute_type.MAX_SPEED:
			max_speed_changed.emit(old, new_value)
		attribute_type.DAMAGE:
			damage_changed.emit(old, new_value)


