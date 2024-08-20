extends CanvasLayer
@export var player: CharacterBody2D

func _ready():
	player.hit.connect(update)
	update()

func update():
	$HealthBar.value = player.current_player_health * 100 / player.max_player_health
	
