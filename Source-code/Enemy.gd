class_name Enemy

extends CharacterBody2D

@export var horizontalSpeed = 200.0
@export var enemyHealth = 100
@export var fireSpeed = 50.0

var playerCollidedWithEnemy: Player = null

@onready var main = get_tree().get_root().get_node("Main")
@onready var loadProjectile = load("res://Projectile.tscn")

func _ready():
	$CooldownProjectileTimer.wait_time = randi_range(1, 3)

func _process(delta):
	if playerCollidedWithEnemy != null and Menu.isGameRunning == true:
		playerCollidedWithEnemy.playerGotDamaged(3)
		#print("Enemy hit player")
	
	

func _physics_process(delta):
	if Menu.isGameRunning == true:
		position.x -= horizontalSpeed * delta

func enemyDamaged(damageAmount):
	if Menu.isGameRunning == true:
		enemyHealth == damageAmount
		
		if enemyHealth <= 0:
			queue_free()

func shootProjectile():
	var instance = loadProjectile.instantiate()
	instance.spawnPosition = global_position - Vector2(-3.0, 25.0)
	main.add_child.call_deferred(instance)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body is Player and Menu.isGameRunning == true:
		playerCollidedWithEnemy = body


func _on_area_2d_body_exited(body):
	if body is Player and Menu.isGameRunning == true:
		playerCollidedWithEnemy = null


func _on_cooldown_projectile_timer_timeout():
	if Menu.isGameRunning == true:
		shootProjectile()
		
		$CooldownProjectileTimer.wait_time = randi_range(1, 3)
