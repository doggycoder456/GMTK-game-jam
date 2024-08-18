class_name creditsMenu

extends Node

var timeToEndCredits

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Start the end credits timer to 0 first
	timeToEndCredits = 0.0
	
	$"ScrollContainer/VBoxContainer/Control/CreditsMenuLabel".text = "Credits Menu"
	$"ScrollContainer/VBoxContainer/Control/CreditsMenuLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/CreditsMenuLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/CreditsMenuLabel".add_theme_font_size_override("font_size", 50)
	$"ScrollContainer/VBoxContainer/Control/CreditsMenuLabel".add_theme_color_override("font_color", 
	Color(0.0, 1.0, 0.0, 0.75)) # RGB code retrieved from Adobe Color Wheel Palette (green)
	
	$"ScrollContainer/VBoxContainer/Control/ProgrammingLabel".text = "Programming"
	$"ScrollContainer/VBoxContainer/Control/ProgrammingLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/ProgrammingLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	$"ScrollContainer/VBoxContainer/Control/ProgrammingLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/ProgrammingLabel".add_theme_color_override("font_color", 
	Color(0.61, 0.35, 0.71, 0.71)) # RGB code retrieved from Adobe Color Wheel Palette (purple)
	
	$"ScrollContainer/VBoxContainer/Control/ProgrammingNamesLabel".text = "Knightrider\nLikesWafflez\nOsama Hussein"
	$"ScrollContainer/VBoxContainer/Control/ProgrammingNamesLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/ProgrammingNamesLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	$"ScrollContainer/VBoxContainer/Control/ProgrammingNamesLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/ProgrammingNamesLabel".add_theme_color_override("font_color", 
	Color(0.61, 0.35, 0.71, 0.71)) # RGB code retrieved from Adobe Color Wheel Palette (purple)
	
	$"ScrollContainer/VBoxContainer/Control/ArtDesignLabel".text = "Art Design"
	$"ScrollContainer/VBoxContainer/Control/ArtDesignLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/ArtDesignLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	$"ScrollContainer/VBoxContainer/Control/ArtDesignLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/ArtDesignLabel".add_theme_color_override("font_color", 
	Color(0.2, 0.6, 0.86, 0.86)) # RGB code retrieved from Adobe Color Wheel Palette (blue)
	
	$"ScrollContainer/VBoxContainer/Control/ArtDesignNamesLabel".text = "Deba\nJason N"
	$"ScrollContainer/VBoxContainer/Control/ArtDesignNamesLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/ArtDesignNamesLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	$"ScrollContainer/VBoxContainer/Control/ArtDesignNamesLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/ArtDesignNamesLabel".add_theme_color_override("font_color", 
	Color(0.2, 0.6, 0.86, 0.86)) # RGB code retrieved from Adobe Color Wheel Palette (blue)
	
	$"ScrollContainer/VBoxContainer/Control/MusicComposerLabel".text = "Music Composer"
	$"ScrollContainer/VBoxContainer/Control/MusicComposerLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/MusicComposerLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	$"ScrollContainer/VBoxContainer/Control/MusicComposerLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/MusicComposerLabel".add_theme_color_override("font_color", 
	Color(0.89, 0.12, 0.39, 0.89)) # RGB code retrieved from Adobe Color Wheel Palette (magenta)
	
	$"ScrollContainer/VBoxContainer/Control/MusicComposerNameLabel".text = "Ruben Skyline"
	$"ScrollContainer/VBoxContainer/Control/MusicComposerNameLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/MusicComposerNameLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	$"ScrollContainer/VBoxContainer/Control/MusicComposerNameLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/MusicComposerNameLabel".add_theme_color_override("font_color", 
	Color(0.89, 0.12, 0.39, 0.89)) # RGB code retrieved from Adobe Color Wheel Palette (magenta)
	
	$"ScrollContainer/VBoxContainer/Control/SFXComposerLabel".text = "SFX Composer"
	$"ScrollContainer/VBoxContainer/Control/SFXComposerLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/SFXComposerLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	$"ScrollContainer/VBoxContainer/Control/SFXComposerLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/SFXComposerLabel".add_theme_color_override("font_color", 
	Color(0.89, 0.12, 0.39, 0.89)) # RGB code retrieved from Adobe Color Wheel Palette (magenta)
	
	$"ScrollContainer/VBoxContainer/Control/SFXComposerNameLabel".text = "Ruben Skyline"
	$"ScrollContainer/VBoxContainer/Control/SFXComposerNameLabel".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"ScrollContainer/VBoxContainer/Control/SFXComposerNameLabel".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	$"ScrollContainer/VBoxContainer/Control/SFXComposerNameLabel".add_theme_font_size_override("font_size", 30)
	$"ScrollContainer/VBoxContainer/Control/SFXComposerNameLabel".add_theme_color_override("font_color", 
	Color(0.89, 0.12, 0.39, 0.89)) # RGB code retrieved from Adobe Color Wheel Palette (magenta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	# Increment the end credits timer by delta
	timeToEndCredits += delta
	
	# Scroll to the bottom of the container by 1 each frame
	$"ScrollContainer".scroll_vertical += 1
	
	# If the end credits timer is greater than 12 seconds, transition to the main scene
	if timeToEndCredits >= 12.0:
		get_tree().change_scene_to_file("res://Main.tscn")
