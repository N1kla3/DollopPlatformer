extends Control

var game_state: GameState

var health_bar: TextureProgressBar
var exp_bar: TextureProgressBar

func _ready() -> void:
	health_bar = %Health
	exp_bar = %Exp
	game_state = get_parent().get_parent()
	var temp_player = game_state.player
	temp_player.health_changed.connect(set_health)
	temp_player.exp_changed.connect(set_exp)
	temp_player.level_changed.connect(set_level)
	
	set_health(0, temp_player.health) 
	set_level(0, temp_player.level) 
	set_exp(0, temp_player.expirience) 

func _process(_delta: float) -> void:
	pass

func set_health(_old_health:int, new_health: int):
	health_bar.set_value(new_health)

func set_level(_old_level:int, _new_level: int):
	pass

func set_exp(_old_exp:int, new_exp: int):
	exp_bar.set_value(new_exp)
