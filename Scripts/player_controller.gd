extends Node

class_name PlayerController

var player : Platform_character
var hud : Hud

func setPlayer(in_player : Platform_character):
	player = in_player
	

func setHud(inHud : Hud):
	hud = inHud

func _input(event: InputEvent) -> void:
	if player && player.score > 100:
		get_tree().change_scene_to_file("res://Levels/ResultScreen.tscn")
	if event is InputEventKey:
		if event.is_pressed and event.keycode == KEY_ESCAPE:
			pass
