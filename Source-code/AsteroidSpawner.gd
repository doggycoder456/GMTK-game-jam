class_name AsteroidSpawner

extends Node2D

@onready var asteroidSpawnTimer := $AsteroidSpawnerTimer

# Instantiate the asteroid here
var instantiateAsteroid := preload("res://Asteroid.tscn")

var asteroidSpawnTime := 0.3

# Called when the node enters the scene tree for the first time.
func _ready():
	asteroidSpawnTimer.start(asteroidSpawnTime)



func _on_asteroid_spawner_timer_timeout():
	# Spawn the asteroid
	var randomizeAsteroidX = randf_range(get_viewport_rect().position.x + 50, get_viewport_rect().end.x - 50)
	var loadAsteroid = instantiateAsteroid
	var asteroid: Asteroid = loadAsteroid.instantiate()
	asteroid.position = Vector2(randomizeAsteroidX, position.y)
	get_tree().current_scene.add_child(asteroid)
	
	# Reset the enemy spawn timer
	asteroidSpawnTimer.start(asteroidSpawnTime)
