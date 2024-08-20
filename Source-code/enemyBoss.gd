class_name enemyBoss

extends Enemy

@export var enemyBossHealth = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyHealthBar.hide()
	$EnemyBossCanvas/EnemyBossHealthBar.value = enemyBossHealth
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$EnemyBossCanvas/EnemyBossHealthBar.value = enemyBossHealth

func _on_area_2d_body_entered(body):
	if body.is_in_group("PlayerProjectile"):
		enemyBossHealth -= 10
		body.queue_free()
		
		$CollisionShape2D.set_deferred("disabled", true) # Replace with function body.
