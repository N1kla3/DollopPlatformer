extends Node2D

class_name GameState

var player_scene = load("res://Scenes/Character.tscn")
var is_player_input_allowed = true
var main_menu_ui : MainMenu
var player: Platform_character
var score: int

func _ready() -> void:
	print("GameState started")
	main_menu_ui = get_node("MenuCanvas/MainMenu")	

func _enter_tree() -> void:
	print("GameState started in enter tree")
	main_menu_ui = get_node("MenuCanvas/MainMenu")	
	player = player_scene.instantiate()
	add_child.call_deferred(player)
	player.global_position = Vector2(149, -130)


func _input(event: InputEvent) -> void:
	if player && player.score > 100:
		get_tree().change_scene_to_file("res://Levels/ResultScreen.tscn")
	if event is InputEventKey:
		if event.is_pressed and event.keycode == KEY_ESCAPE:
			main_menu_ui.toggle_menu(true)
