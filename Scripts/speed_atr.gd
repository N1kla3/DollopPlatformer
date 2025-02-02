extends Node

class_name speed_atr

@export var speed : int : set = setSpeed
@export var max_speed : int : set = setMaxSpeed
var effects : Array[effect]

signal speed_change(int)
signal max_speed_change(int)

class effect:
	var speed : int
	var max_speed : int
	var duration : float


func setSpeed(value : int):
	speed += value
	clamp(speed, 0, max_speed)
	speed_change.emit(speed)
	
func setMaxSpeed(value : int):
	max_speed += value
	max_speed_change.emit(max_speed)

func addEffect():
	pass

func removeEffect():
	pass
