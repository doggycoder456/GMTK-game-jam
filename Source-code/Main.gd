extends Node2D


# Called when the node enters the scene tree for the first time.

func _ready():
	$Player.hide() # Replace with function body.


func game_over():
	$HUD.show_game_over()

func new_game():
	$Player.start()
	$HUD.show_message("Get Ready")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
