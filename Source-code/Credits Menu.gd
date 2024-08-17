class_name creditsMenu

extends Node

var timeToEndCredits

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Start the end credits timer to 0 first
	timeToEndCredits = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	# Increment the end credits timer by delta
	timeToEndCredits += delta
	
	# Scroll to the bottom of the container by 1 each frame
	$"ScrollContainer".scroll_vertical += 1
	
	# If the end credits timer is greater than 13 seconds, transition to the main scene
	if timeToEndCredits >= 13.0:
		get_tree().change_scene_to_file("res://Main.tscn")
	
	if !$"CreditsMenuTitleAnimationPlayer".is_playing():
		$"CreditsMenuTitleAnimationPlayer".play("Credits Menu Title Animation")
	
	if !$"ProgrammingTextAnimationPlayer".is_playing():
		$"ProgrammingTextAnimationPlayer".play("Programming Text Animation")
	
	if !$"KnightriderAnimationPlayer".is_playing():
		$"KnightriderAnimationPlayer".play("Knightrider Text Animation")
	
	if !$"LikesWafflezAnimationPlayer".is_playing():
		$"LikesWafflezAnimationPlayer".play("LikesWafflez Text Animation")
	
	if !$"OsamaHusseinAnimationPlayer".is_playing():
		$"OsamaHusseinAnimationPlayer".play("Osama Hussein Text Animation")
	
	if !$"ArtDesignAnimationPlayer".is_playing():
		$"ArtDesignAnimationPlayer".play("Art Design Text Animation")
	
	if !$"DebaAnimationPlayer".is_playing():
		$"DebaAnimationPlayer".play("Deba Text Animation")
	
	if !$"JasonNAnimationPlayer".is_playing():
		$"JasonNAnimationPlayer".play("Jason N Text Animation")
	
	if !$"MusicComposerAnimationPlayer".is_playing():
		$"MusicComposerAnimationPlayer".play("Music Composer Text Animation")
	
	if !$"RubenSkylineAnimationPlayer".is_playing():
		$"RubenSkylineAnimationPlayer".play("Ruben Skyline Text Animation")
	
	if !$"SFXComposerAnimationPlayer".is_playing():
		$"SFXComposerAnimationPlayer".play("SFX Composer Text Animation")
	
	if !$"RubenSkylineAnimationPlayer2".is_playing():
		$"RubenSkylineAnimationPlayer2".play("Ruben Skyline Text Animation 2")
	
