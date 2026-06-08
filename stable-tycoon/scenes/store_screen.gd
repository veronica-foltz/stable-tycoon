extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_better_feed_button_pressed():

	print("Bought Better Feed")

func _on_grooming_kit_button_pressed():

	print("Bought Grooming Kit")

func _on_energy_treat_button_pressed():

	print("Bought Energy Treats")
