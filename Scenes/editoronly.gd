extends Node

func _ready():
	if not Engine.is_editor_hint():
		queue_free()
