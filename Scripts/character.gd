extends CharacterBody2D

class_name Platform_character

const JUMP_VELOCITY = -400.0

const MOVELEFT = 'move_left'
const MOVERIGHT = 'move_right'

const MOVEUP = 'move_up'
const MOVEDOWN = 'move_down'

const JUMP = 'jump'

const level_up_point: int = 50

var game_state : GameState
var expirience: int = 0 : set = setExp
var level: int = 1 : set = setLevel
var score: int = 0 : set = setScore

signal exp_changed(old_value, new_value)
signal level_changed(old_value, new_value)
signal score_changed(old_value, new_value)

@export var animation : SpriteFrames

@onready var animation_sprite = $AnimatedSprite2D
@onready var health_comp : health_atr = %Health_comp
@onready var speed_comp : speed_atr = %Speed_comp

func setExp(new_val : int):
	var cache = expirience
	expirience = new_val
	exp_changed.emit(cache, expirience)

func setLevel(new_val : int):
	var cache = level
	level = new_val
	level_changed.emit(cache, level)

func setScore(new_val : int):
	var cache = score
	score = new_val
	score_changed.emit(cache, score)

func _ready() -> void:
	animation_sprite.sprite_frames = animation
	game_state = get_parent()
	set_motion_mode(MOTION_MODE_GROUNDED)
	health_comp.health_change.connect(hp_changed)

func setPlatformCollision(value : bool):
	set_collision_mask_value(4, value)

func hp_changed(new_val):
	if (new_val <= 0):
		print("character has died")
		queue_free()


func _physics_process(delta: float) -> void:
	if game_state and not game_state.is_player_input_allowed:
		return
	var speed = speed_comp.speed
	velocity.x = 0

	var direction = Input.get_vector(MOVELEFT, MOVERIGHT, MOVEUP, MOVEDOWN)
	velocity.x += speed * direction.x

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(JUMP) and is_on_floor():
		setPlatformCollision(false)
		call_deferred("setPlatformCollision", true)
		velocity.y = JUMP_VELOCITY


	move_and_slide()
