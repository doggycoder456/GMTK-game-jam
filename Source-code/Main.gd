extends Node2D


# Called when the node enters the scene tree for the first time.

func _ready():
	$Player.hide()
	new_game() # Replace with function body.


func game_over():
	new_game()
	$HUD.show_game_over()
	$Player.hide()

func new_game():
	$Player.hide()
	$HUD.hide()
	$Player.start()
	$HUD.show()
	$HUD.show_message("Get Ready")
	$Player.show()

func _process(delta):
	pass


func _on_player_hit():
	$Player.current_player_health -= 10 # Replace with function body.
