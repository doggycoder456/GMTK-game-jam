class_name Main

extends Node2D


# Called when the node enters the scene tree for the first time.

func _ready():
	$Player.hide()
	$"Enemy".hide()
	$"Enemy".set_process(false)
	$"Enemy".set_physics_process(false)
	#new_game() # Replace with function body.


func game_over():
	new_game()
	$HUD.show_game_over()
	$Player.hide() # Replace with function body.
	$"Enemy".hide()
	$"Enemy".set_process(false)
	$"Enemy".set_physics_process(false)

func new_game():
	$Player.start()
	$HUD.show()
	
	$"Enemy".show()
	$"Enemy".set_process(true)
	$"Enemy".set_physics_process(true)
	
	$HUD.show_message("Get Ready")
	$Player.show()

func _process(delta):
	pass


func _on_player_hit():
	$Player.current_player_health -= 10 # Replace with function body.
