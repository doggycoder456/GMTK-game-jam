extends CharacterBody2D
signal hit;

@export var player_speed = 300
@export var max_player_health  = 100
@export var current_player_health = max_player_health

var screensize;

func start():
	show()
	screensize = get_viewport_rect().size
	if (position.x != screensize.x / 4 && position.y != screensize.y / 2):
		position.x = screensize.x / 6
		position.y = (screensize.y / 2)
	$CollisionShape2D.disabled = false
		
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
	






func _on_area_2d_area_entered(area):
	hit.emit()
	print(hit)
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
