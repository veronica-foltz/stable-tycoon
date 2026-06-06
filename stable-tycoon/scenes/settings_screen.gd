extends Control

var music_on = true
var sound_on = true

@onready var music_button = $MusicButton
@onready var sound_button = $SoundButton




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready():
	var bus_index = AudioServer.get_bus_index("Master")
	music_on = not AudioServer.is_bus_mute(bus_index)
	if music_on:
		music_button.text = "Music: On"
	else:
		music_button.text = "Music: Off"
		
	sound_on = not AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))
	if sound_on:
		sound_button.text = "Sound: On"
	else:
		sound_button.text = "Sound: Off"	

func _on_music_button_pressed():

	music_on = not music_on
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_index, not music_on)
	if music_on:
		music_button.text = "Music: On"
	else:
		music_button.text = "Music: Off"

func _on_sound_button_pressed():

	sound_on = !sound_on
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_index, not sound_on)
	if sound_on:
		sound_button.text = "Sound: On"
	else:
		sound_button.text = "Sound: Off"

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
