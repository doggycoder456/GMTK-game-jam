extends CharacterBody2D

@export var projectile_speed = 300
var dir : float
var spawnPos: Vector2

func _ready():
	global_position = spawnPos
	
func _physics_process(_delta):
	velocity = Vector2(0, -projectile_speed).rotated(dir)
	move_and_slide()





func _on_area_2d_body_entered(body):
	print("HIT") # Replace with function body.
