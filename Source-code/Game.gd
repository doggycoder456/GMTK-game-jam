class_name Game

extends Node2D

static var enemiesKilled
static var isPlayerInLevel1

# Called when the node enters the scene tree for the first time.

func _ready():
	enemiesKilled = 0
	
	isPlayerInLevel1 = true
	Level2.isPlayerInLevel2 = false
	Level3.isPlayerInLevel3 = false

func _process(delta):
	pass
