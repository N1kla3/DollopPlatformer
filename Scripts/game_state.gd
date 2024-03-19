extends Node2D

class_name GameState

var is_player_input_allowed = true
var main_menu_ui : MainMenu

func _ready() -> void:
	print("GameState started")
	main_menu_ui = get_node("MenuCanvas/MainMenu")	

func _enter_tree() -> void:
	print("GameState started in enter tree")
	main_menu_ui = get_node("MenuCanvas/MainMenu")	


func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed and event.keycode == KEY_ESCAPE:
			main_menu_ui.toggle_menu(true)
