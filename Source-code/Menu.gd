class_name Menu

extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	$MenuMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")





func _on_exit_button_pressed():
	get_tree().quit()



func _on_settings_button_pressed():
	print("Settings opened") # Replace with function body.



func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Credits Menu.tscn") # Replace with function body.


func _on_start_button_mouse_entered():
	$StartMusic.play() # Replace with function body.
