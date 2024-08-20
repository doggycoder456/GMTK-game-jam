class_name Player

extends CharacterBody2D

signal hit;
signal dead;

@export var player_speed = 300
@export var max_player_health  = 100
@export var current_player_health = max_player_health

var screensize;

func start():
	screensize = get_viewport_rect().size
	position.x = screensize.x / 6
	position.y = (screensize.y / 2)
	current_player_health = max_player_health
		
func _ready():
	start()

func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screensize)


func playerGotDamaged(amountOfDamage):
	
	current_player_health -= amountOfDamage



func _on_area_2d_area_entered(area):
	hit.emit()
	
	if current_player_health <= 0:
		dead.emit()
	
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)


func _on_area_2d_body_entered(body):
	
	# If the player collides with the projectile body, destroy the projectile and decrease player's health
	if body.is_in_group("Projectile"):
		body.queue_free()
		
		current_player_health -= 2
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's health
	if body.is_in_group("Asteroid") and Asteroid.asteroidSpriteIndex == 0:
		
		current_player_health -= 10
		
		scale += Vector2(0.5, 0.5)
		
		if scale >= Vector2(5.0, 5.0):
			scale = Vector2(5.0, 5.0)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's scale
	if body.is_in_group("Asteroid") and Asteroid.asteroidSpriteIndex == 1:
		
		scale -= Vector2(0.25, 0.25)
		
		if scale <= Vector2(0.5, 0.5):
			scale = Vector2(0.5, 0.5)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's health and increase the scale
	if body.is_in_group("Asteroid") and Asteroid.asteroidSpriteIndex == 2:
		
		current_player_health -= 5
		
		scale += Vector2(0.25, 0.25)
		
		if scale >= Vector2(5.0, 5.0):
			scale = Vector2(5.0, 5.0)
		
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred("disabled", true)
	
	# If the player collides with the asteroid body, decrease player's scale
	if body.is_in_group("Asteroid") and Asteroid.asteroidSpriteIndex == 3:
		
		scale -= Vector2(0.5, 0.5)
		
		print("Player hit asteroid 4")
		
		if scale <= Vector2(0.5, 0.5):
			scale = Vector2(0.5, 0.5)
		
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


func _on_asteroid_spawner_timer_timeout():
	pass # Replace with function body.
