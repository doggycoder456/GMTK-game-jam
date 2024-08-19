class_name Main

extends Node2D

static var isGameRunning : bool

# Called when the node enters the scene tree for the first time.

func _ready():
	isGameRunning = false
	
	#$Projectile.hide()
	#$Projectile.set_process(false)
	#$Projectile.set_physics_process(false)
	$Player.hide()
	$Player.set_process(false)
	$Player.set_physics_process(false)
	$Enemy.hide()
	$Enemy.set_process(false)
	$Enemy.set_physics_process(false)
	#new_game() # Replace with function body.


func game_over():
	isGameRunning = false
	new_game()
	
	#$Projectile.hide()
	#$Projectile.set_process(false)
	#$Projectile.set_physics_process(false)
	
	$HUD.show_game_over()
	$Player.hide() # Replace with function body.
	$Player.set_process(false)
	$Player.set_physics_process(false)
	$Enemy.hide()
	$Enemy.set_process(false)
	$Enemy.set_physics_process(false)

func new_game():
	isGameRunning = true
	
	#$Projectile.show()
	#$Projectile.set_process(true)
	#$Projectile.set_physics_process(true)
	
	$Player.start()
	$Player.set_process(true)
	$Player.set_physics_process(true)
	$HUD.show()
	
	$Enemy.show()
	$Enemy.set_process(true)
	$Enemy.set_physics_process(true)
	
	$HUD.show_message("Get Ready")
	$Player.show()

func _process(delta):
	pass

func _on_player_hit():
	if isGameRunning == true:
		$Player.current_player_health -= 10 # Replace with function body.
