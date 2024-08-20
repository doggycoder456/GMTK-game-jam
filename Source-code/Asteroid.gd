class_name Asteroid

extends CharacterBody2D

static var asteroidSpriteIndex

@export var fallingSpeed = 500.0

@onready var game = get_tree().get_root().get_node("Game")

func _ready():
	
	asteroidSpriteIndex = randi_range(0, 4)
	
	if asteroidSpriteIndex == 0:
		$AsteroidSprite.texture = load("res://Asteroid 1.png")
	
	if asteroidSpriteIndex == 1:
		$AsteroidSprite.texture = load("res://Asteroid 2.png")
	
	if asteroidSpriteIndex == 2:
		$AsteroidSprite.texture = load("res://Asteroid 3.png")
	
	if asteroidSpriteIndex == 3:
		$AsteroidSprite.texture = load("res://Asteroid 4.png")

func _physics_process(delta):
	
	position.y += fallingSpeed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
