extends Control

class_name MainMenu

var start_button : BaseButton
var exit_button : BaseButton
var settings_button : BaseButton

var game_state : GameState

func _ready() -> void:
	print("Main menu is ready")
	start_button = get_node("CenterContainer/VBoxContainer/StartButton")
	exit_button = get_node("CenterContainer/VBoxContainer/ExitButton")
	settings_button = get_node("CenterContainer/VBoxContainer/Settings")
	game_state = get_parent().get_parent()

	game_state.is_player_input_allowed = false

	start_button.pressed.connect(start_button_pressed)
	exit_button.pressed.connect(exit_button_pressed)
	settings_button.pressed.connect(on_settings)
	get_tree().paused = true

func _enter_tree() -> void:
	print("Main menu entered the tree")
	
func start_button_pressed():
	print('Play button pressed')
	game_state.is_player_input_allowed = true
	toggle_menu(false)

func exit_button_pressed():
	print('Exit')
	get_tree().quit()

func on_settings():
	pass

func toggle_menu(enabled : bool):
	if enabled:
		show()
	else:
		hide()
	get_tree().paused = enabled
	
