class_name Player

extends CharacterBody2D

signal hit
signal dead

@export var player_speed = 300
@export var max_player_health  = 100
@export var current_player_health = max_player_health

var screensize;

func start():
	screensize = get_viewport_rect().size
	position.x = screensize.x / 6
	position.y = (screensize.y / 2)
	current_player_health = max_player_health
		
func _ready():
	start()

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


func playerGotDamaged(amountOfDamage):
	
	current_player_health -= amountOfDamage



func _on_area_2d_area_entered(area):
	hit.emit()
	if current_player_health <= 0:
		dead.emit()
		
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
