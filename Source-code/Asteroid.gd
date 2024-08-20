class_name Asteroid

extends CharacterBody2D

static var asteroidSpriteIndex

@export var fallingSpeed = 500.0

@onready var game = get_tree().get_root().get_node("Game")

func _ready():
	pass

func _physics_process(delta):
	
	position.y += fallingSpeed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
