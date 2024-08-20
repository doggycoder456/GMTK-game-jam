class_name Player

extends CharacterBody2D

signal hit;
signal dead;

@export var player_speed = 300
@export var max_player_health  = 100
@export var current_player_health = max_player_health
@onready var loadProjectile = load("res://PlayerProjectile.tscn")
@onready var game = get_tree().get_root().get_node("Game")
@onready var level3 = get_tree().get_root().get_node("Level3")
var screensize;

func start():
	screensize = get_viewport_rect().size
	position.x = screensize.x / 6
	position.y = (screensize.y / 2)
	current_player_health = max_player_health
		
func _ready():
	start()

func _process(delta):
	if current_player_health <= 0:
		dead.emit()
		
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("space"):
		$FiringCooldown.start($FiringCooldown.wait_time)
			
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screensize)
	

func shootProjectile():
	if Game.isPlayerInLevel1 == true and Level2.isPlayerInLevel2 == false:
		var instance = loadProjectile.instantiate()
		instance.spawnPosition = global_position + instance.position * 10
		game.add_child.call_deferred(instance)
	
	if Level3.isPlayerInLevel3 == true:
		var instance = loadProjectile.instantiate()
		instance.spawnPosition = global_position + instance.position * 10
		level3.add_child.call_deferred(instance)


func playerGotDamaged(amountOfDamage):
	
	current_player_health -= amountOfDamage



func _on_area_2d_area_entered(area):
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)


func _on_area_2d_body_entered(body):
	
	# If the player collides with the projectile body, destroy the projectile and decrease player's health
	if body.is_in_group("Projectile"):
		body.queue_free()
		current_player_health -= 2
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	if body.is_in_group("Asteroid1"):
		
		current_player_health -= 10
		
		scale += Vector2(0.5, 0.5)
		
		if scale >= Vector2(5.0, 5.0):
			scale = Vector2(5.0, 5.0)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's scale
	if body.is_in_group("Asteroid2"):
		
		scale -= Vector2(0.25, 0.25)
		
		if scale <= Vector2(0.5, 0.5):
			scale = Vector2(0.5, 0.5)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's health and increase the scale
	if body.is_in_group("Asteroid3"):
		
		current_player_health -= 5
		
		scale += Vector2(0.25, 0.25)
		
		if scale >= Vector2(5.0, 5.0):
			scale = Vector2(5.0, 5.0)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's scale
	if body.is_in_group("Asteroid4"):
		
		scale -= Vector2(0.5, 0.5)
		
		print("Player hit asteroid 4")
		
		if scale <= Vector2(0.5, 0.5):
			scale = Vector2(0.5, 0.5)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# For now, take the player back to the main menu after they collided with Saturn
	if body.is_in_group("Saturn"):
		
		get_tree().change_scene_to_file("res://Menu.tscn")
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# For now, the player will take damage if it collides with the enemy
	if body.is_in_group("Enemy"):
		
		current_player_health -= 1
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# For now, the player will take damage if it collides with the enemy boss
	if body.is_in_group("EnemyBoss"):
		
		current_player_health -= 20
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)


func _on_firing_cooldown_timeout():
	shootProjectile()
