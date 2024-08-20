class_name Level2

extends Node2D

static var isPlayerInLevel2

# Called when the node enters the scene tree for the first time.
func _ready():
	isPlayerInLevel2 = true
	Level3.isPlayerInLevel3 = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$"TransitionRiser".playing:
		$"TransitionRiser".play()
