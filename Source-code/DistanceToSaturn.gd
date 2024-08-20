extends CanvasLayer
@export var player: CharacterBody2D
@export var saturn: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player.hit.connect(update)
	update()

func _process(delta):
	$SaturnProgressBar.value = (saturn.position.x / $SaturnProgressBar.max_value) * $SaturnProgressBar.max_value

func update():
	$SaturnProgressBar.value = (saturn.position.x / $SaturnProgressBar.max_value) * $SaturnProgressBar.max_value
