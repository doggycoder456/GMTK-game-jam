class_name Enemy

extends CharacterBody2D

@export var horizontalSpeed = 200.0
@export var enemyHealth = 100

@onready var game = get_tree().get_root().get_node("Game") # asteroid file is not here
@onready var loadProjectile = load("res://Projectile.tscn")

func _ready():
	$CooldownProjectileTimer.wait_time = randf_range(0.5, 1.0)
	
	$EnemyHealthBar.value = enemyHealth

func _process(delta):
	
	$EnemyHealthBar.value = enemyHealth
	
	# Destroy the enemy when their health is at 0
	if enemyHealth <= 0:
		queue_free()
	

func _physics_process(delta):
	position.x -= horizontalSpeed * delta
	
func shootProjectile():
	var instance = loadProjectile.instantiate()
	instance.spawnPosition = global_position - instance.position
	game.add_child.call_deferred(instance)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_cooldown_projectile_timer_timeout():
	shootProjectile()
	
	$CooldownProjectileTimer.wait_time = randf_range(0.5, 1.0)


func _on_area_2d_body_entered(body):
	if body.is_in_group("PlayerProjectile"):
		enemyHealth -= 10
		body.queue_free()
		
		$CollisionShape2D.set_deferred("disabled", true) # Replace with function body.
