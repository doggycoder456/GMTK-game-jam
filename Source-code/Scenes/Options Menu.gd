class_name optionsMenu

extends Node

static var musicVolume = 1
static var sfxVolume = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	get_node("MusicVolumeSlider").value = musicVolume
	get_node("SFXVolumeSlider").value = sfxVolume


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	musicVolume = get_node("MusicVolumeSlider").value
	sfxVolume = get_node("SFXVolumeSlider").value
	
	$MusicVolumeSlider/MusicVolumePercentage.text = str(musicVolume * 100) + "%"
	$MusicVolumeSlider/MusicVolumePercentage.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$MusicVolumeSlider/MusicVolumePercentage.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$MusicVolumeSlider/MusicVolumePercentage.add_theme_font_size_override("font_size", 30)
	
	$SFXVolumeSlider/SFXVolumePercentage.text = str(sfxVolume * 100) + "%"
	$SFXVolumeSlider/SFXVolumePercentage.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$SFXVolumeSlider/SFXVolumePercentage.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$SFXVolumeSlider/SFXVolumePercentage.add_theme_font_size_override("font_size", 30)
	
	if !$"MusicVolumeTextAnimation".is_playing():
		$"MusicVolumeTextAnimation".play("Music Volume Text Animation")
	
	if !$"SFXVolumeTextAnimation".is_playing():
		$"SFXVolumeTextAnimation".play("SFX Volume Text Animation")
		
