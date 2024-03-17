extends Control

class_name MainMenu

var start_button : BaseButton
var exit_button : BaseButton

func _ready() -> void:
	start_button = get_node("CenterContainer/VBoxContainer/StartButton")
	exit_button = get_node("CenterContainer/VBoxContainer/ExitButton")
	start_button.pressed.connect(start_button_pressed)
	exit_button.pressed.connect(exit_button_pressed)

func _process(delta: float) -> void:
	print(has_focus())

func start_button_pressed():
	print('start')
	start_button.disabled = true
	hide()

func exit_button_pressed():
	print('Exit')
	get_tree().quit()
