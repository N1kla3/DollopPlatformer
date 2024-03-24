extends Node2D
class_name ProjectileSpawner

var bullet_scene = load("res://Scenes/Bullet.tscn")
var bullet: Bullet
@export var projectile_spawn_delta: float = 1
var temp_time: float = 0

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	temp_time += delta
	if temp_time > projectile_spawn_delta:
		spawn_projectile(Vector2(1000, -1000))
		temp_time = 0


func spawn_projectile(target: Vector2):
	print("Spawn projectile")
	# bullet = Bullet.new()	
	bullet = bullet_scene.instantiate()
	bullet.transform = transform
	get_tree().root.add_child(bullet)
	bullet.fly_to(target)
