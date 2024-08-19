class_name Projectile

extends CharacterBody2D

@export var projectileSpeed = 500.0

var spawnPosition : Vector2

func _ready():
	global_position = spawnPosition

func _process(delta):
	pass

func _physics_process(delta):
	velocity = Vector2(-projectileSpeed, 0.0)
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
