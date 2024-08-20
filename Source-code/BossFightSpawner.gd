class_name BossFightSpawner

extends Node2D

# Instantiate the asteroid here
var instantiateBossFight := preload("res://enemyBoss.tscn")

var loadEnemyBoss = instantiateBossFight
var theEnemyBoss := loadEnemyBoss.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	theEnemyBoss.position = Vector2(position.x, position.y)
	get_tree().current_scene.add_child(theEnemyBoss)
	
