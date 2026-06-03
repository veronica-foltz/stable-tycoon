extends Control

var hunger = 50
@onready var hunger_label = $HungerLabel

func _ready():
	update_hunger_label()
	update_happiness_label()
	update_energy_label()

func update_hunger_label():
	hunger_label.text = "Horse Hunger: " + str(hunger)

func _on_feed_button_pressed():

	if hunger < 100:
		hunger += 10
		
		if hunger > 100:
			hunger = 100
			
	happiness += 5
	if happiness > 100:
		happiness = 100
		
	energy += 2
	
	if energy > 100:
		energy = 100
		
	update_hunger_label()
	update_happiness_label()
	update_energy_label()


var happiness = 70
@onready var happiness_label = $HappinessLabel

func update_happiness_label():
	happiness_label.text = "Happiness: " + str(happiness)
	
var energy = 80
@onready var energy_label = $EnergyLabel

func update_energy_label():
	energy_label.text = "Energy: " + str(energy)
