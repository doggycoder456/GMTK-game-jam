class_name EnemySpawner

extends Node2D

@onready var enemySpawnTimer := $EnemySpawnerTimer

# Instantiate any enemy types here
var instantiateEnemies := [
	preload("res://Enemy.tscn")
	]

var spawnTime := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	enemySpawnTimer.start(spawnTime)


func _on_enemy_spawner_timer_timeout():
	# Spawn any enemy
	var randomizeEnemyY = randf_range(get_viewport_rect().position.x + 50, get_viewport_rect().end.x - 50)
	var loadEnemy = instantiateEnemies[randi() % instantiateEnemies.size()]
	var enemy: Enemy = loadEnemy.instantiate()
	enemy.position = Vector2(position.x, randomizeEnemyY)
	get_tree().current_scene.add_child(enemy)
	
	# Reset the enemy spawn timer
	enemySpawnTimer.start(spawnTime)
