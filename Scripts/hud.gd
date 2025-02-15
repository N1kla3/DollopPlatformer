extends Control
class_name Hud

var game_state: GameState
var player : Platform_character

var health_bar: TextureProgressBar
var exp_bar: TextureProgressBar
var score_label: Label

func _ready() -> void:
	health_bar = %Health
	exp_bar = %Exp
	score_label = %ScoreLabel

	# game_state = get_parent().get_parent()
	# player = game_state.player
	# if player:
	# 	player.score_changed.connect(set_score)
	# 	player.ready.connect(setup_attributes)

	
	# set_score(0, player.score)

func _process(_delta: float) -> void:
	pass

func set_health(_vlaue : int):
	health_bar.min_value = 0
	health_bar.value = player.health_comp.health
	health_bar.max_value = player.health_comp.max_health

func set_level(_new_level: int):
	pass

func set_exp(new_exp: int):
	exp_bar.set_value(new_exp)

func set_score(_old_score : int, new_score : int):
	score_label.text = str("Score: ", new_score)

func setup_attributes():
	player.health_comp.health_change.connect(set_health)
	player.level_comp.level_changed.connect(set_level)
	player.level_comp.exp_changed.connect(set_exp)
	set_health(player.health_comp.health)
	set_level(player.level_comp.level) 
	set_exp(player.level_comp.experience) 
