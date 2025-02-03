extends Node

class_name health_atr

class effect_data:

	func _init(in_value : int, in_duration : float, new_id : int):
		value = in_value
		duration = in_duration
		id = new_id

	var value : int
	var duration : float
	var id : int

@export var max_health : int
@export var health : int : set=add_value

var effects : Array[effect_data]
static var unique_id = 0

signal health_change(value : int)

func add_value(value : int):
	health += value;
	health = clampi(health, 0, max_health)
	print("new health is ", health)
	health_change.emit(health)


func add_effect(value : int, duration : float) -> int:
	unique_id += 1
	effects.append(effect_data.new(value, duration, unique_id))
	return unique_id

func remove_effect(value : int):
	var index = 0
	for eff in effects:
		if eff.id == value:
			add_value(-eff.value)
			effects.remove_at(index)
			return
		index += 1

func _process(delta: float) -> void:
	var to_remove : Array
	for eff in effects:
		eff.duration -= delta
		if eff.duration <= 0:
			to_remove.append(eff.id)

	for id in to_remove:
		remove_effect(id)
