class_name Enemy

extends CharacterBody2D

@export var horizontalSpeed = 200.0
@export var enemyHealth = 100
@export var fireSpeed = 50.0

var playerCollidedWithEnemy: Player = null

@onready var game = get_tree().get_root().get_node("Game")
@onready var loadProjectile = load("res://Projectile.tscn")

func _ready():
	$CooldownProjectileTimer.wait_time = randf_range(0.5, 1.0)

func _process(delta):
	if playerCollidedWithEnemy != null:
		playerCollidedWithEnemy.playerGotDamaged(3)
		#print("Enemy hit player")
	
	

func _physics_process(delta):
	
	position.x -= horizontalSpeed * delta

func enemyDamaged(damageAmount):
	enemyHealth == damageAmount
	
	if enemyHealth <= 0:
		queue_free()

func shootProjectile():
	var instance = loadProjectile.instantiate()
	instance.spawnPosition = global_position - Vector2(-3.0, 25.0)
	game.add_child.call_deferred(instance)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body is Player:
		playerCollidedWithEnemy = body


func _on_area_2d_body_exited(body):
	if body is Player:
		playerCollidedWithEnemy = null


func _on_cooldown_projectile_timer_timeout():
	shootProjectile()
	
	$CooldownProjectileTimer.wait_time = randf_range(0.5, 1.0)
