class_name Player

extends CharacterBody2D

signal hit;
signal dead;

@export var player_speed = 300
@export var max_player_health  = 100
@export var current_player_health = max_player_health
@onready var loadProjectile = load("res://PlayerProjectile.tscn")
@onready var game = get_tree().get_root().get_node("Game")
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
	var instance = loadProjectile.instantiate()
	instance.spawnPosition = global_position + instance.position * 10
	game.add_child.call_deferred(instance)


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
