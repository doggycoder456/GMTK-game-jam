extends Node2D

@onready var main = get_tree().get_root().get_node("Main")
@onready var projectile = load("res://Projectiles.tscn")


func _process(delta):
	if Input.is_action_just_pressed("space"):
		shoot()
		 
func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	main.add_child.call_deferred(instance)
	
