extends Control

class_name ResultScreen

var main_menu_button : BaseButton

func _ready() -> void:
	main_menu_button = %MainMenu
	main_menu_button.pressed.connect(on_main_menu_pressed)

func on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Levels/root.tscn")
