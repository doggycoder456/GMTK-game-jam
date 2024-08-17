class_name Player

extends CharacterBody2D


@export var player_speed = 300
var screensize;
signal hit;

func _ready():
	screensize = get_viewport_rect().size
	if (position.x != screensize.x / 4 && position.y != screensize.y / 2):
		position.x = screensize.x / 6
		position.y = (screensize.y / 2)

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
	




func _on_collison_zone_2d_body_entered(body):
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
