class_name SaturnSpawner

extends Node2D

var saturnSpeed = 10.0

# Instantiate saturn here
var instantiateSaturn := preload("res://Saturn.tscn")

var loadSaturn = instantiateSaturn
var saturn := loadSaturn.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	saturn.position = Vector2(position.x, position.y)
	get_tree().current_scene.add_child(saturn)
	
	position.x -= saturnSpeed * delta
	
	if position.x <= 3000.0 and Game.isPlayerInLevel1 == true and Level2.isPlayerInLevel2 == false:
		get_tree().change_scene_to_file("res://Level_2.tscn")
	
	if position.x <= 1000.0 and Level2.isPlayerInLevel2 == true and Level3.isPlayerInLevel3 == false:
		get_tree().change_scene_to_file("res://Level_3.tscn")
