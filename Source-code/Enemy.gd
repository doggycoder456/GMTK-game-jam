class_name Enemy

extends CharacterBody2D

@export var horizontalSpeed = 200.0
@export var enemyHealth = 100

var playerCollidedWithEnemy: Player = null

func _process(delta):
	if playerCollidedWithEnemy != null:
		playerCollidedWithEnemy.playerGotDamaged(3)
		print("Enemy hit player")

func _physics_process(delta):
	position.x -= horizontalSpeed * delta

func enemyDamaged(damageAmount):
	enemyHealth == damageAmount
	
	if enemyHealth <= 0:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body is Player:
		playerCollidedWithEnemy = body


func _on_area_2d_body_exited(body):
	if body is Player:
		playerCollidedWithEnemy = null
