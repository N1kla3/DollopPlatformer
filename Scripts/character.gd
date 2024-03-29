extends CharacterBody2D

class_name Platform_character

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const MOVELEFT = 'move_left'
const MOVERIGHT = 'move_right'

const MOVEUP = 'move_up'
const MOVEDOWN = 'move_down'

const JUMP = 'jump'

var game_state : GameState
var health: int = 100

@export var animation : SpriteFrames

@onready var animation_sprite = $AnimatedSprite2D

func _ready() -> void:
	animation_sprite.sprite_frames = animation
	game_state = get_parent()


func _physics_process(delta: float) -> void:
	if game_state and not game_state.is_player_input_allowed:
		return

	var direction = Input.get_vector(MOVELEFT, MOVERIGHT, MOVEUP, MOVEDOWN)
	velocity.x = SPEED * direction.x

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# var direction := Input.get_axis("ui_left", "ui_right")
	# if direction:
		# velocity.x = direction * SPEED
	# else:
		# velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
