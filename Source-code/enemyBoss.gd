class_name enemyBoss

extends Enemy

@export var enemyBossHealth = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyHealthBar.value = enemyBossHealth
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
