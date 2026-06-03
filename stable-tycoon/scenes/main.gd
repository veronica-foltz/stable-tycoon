extends Control

var hunger = 50

@onready var hunger_label = $HungerLabel

func _ready():

	update_hunger_label()

func update_hunger_label():

	hunger_label.text = "Horse Hunger: " + str(hunger)


func _on_feed_button_pressed():
	if hunger < 100:
		hunger += 10
		
		if hunger > 100:
			hunger = 100
			
	update_hunger_label()
