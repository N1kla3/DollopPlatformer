extends Node

class_name level_atr

signal exp_changed(value : int)
signal level_changed(value : int)

var experience : int = 0 : set = addExp
var level : int

@export var LevelUpTable : LevelTable

func addExp(value : int):
	experience += value
	exp_changed.emit(experience)
	var new_level = calcLevel()
	if new_level != level:
		level = new_level
		level_changed.emit(level)


func calcLevel() -> int:
	var temp_exp = 0
	var temp_level = 0
	for exp_for_lvl in LevelUpTable.ExpThresholds:
		temp_level += 1
		temp_exp += exp_for_lvl
		if temp_exp > experience:
			return temp_level
	return 0


