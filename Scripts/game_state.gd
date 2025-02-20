extends Node2D

class_name GameState

# CONFIG
@export var player_class : PackedScene
@export var hud_class : PackedScene
@export var controller_class : PackedScene
@export var spawn_point : Node2D

# STATE
var is_player_input_allowed = true
var score: int

var controller : PlayerController

func _ready() -> void:
	print("GameState started")

func _enter_tree() -> void:
	print("GameState started in enter tree")
	# want to spawn hud first
	var hud = hud_class.instantiate()
	var player = player_class.instantiate()
	controller = controller_class.instantiate()
	assert(player, "Player class not set!!")
	assert(controller, "Controller class not set!!")
	assert(hud, "Hud class not set!!")
	controller.setPlayer(player)
	controller.setHud(hud)
	player.onPlayerReady()
	hud.playerChanged(player)

	add_child.call_deferred(player)
	if false: # reserved for save files
		pass
	else:
		player.global_position = spawn_point.global_position

	add_child.call_deferred(controller)
	var canvas = CanvasLayer.new()
	add_child.call_deferred(canvas)
	canvas.add_child.call_deferred(hud)

