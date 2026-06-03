extends Control

var hunger = 50
@onready var hunger_label = $HungerLabel

func _ready():
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_day_label()

func update_hunger_label():
	hunger_label.text = "Hunger: " + str(hunger)

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
	

var day = 1
@onready var day_label = $DayLabel

func update_day_label():
	day_label.text = "Day: " + str(day)

func _on_end_day_button_pressed():
	day += 1
	hunger -= 15
	happiness -= 10
	energy -= 20

	if hunger < 0:
		hunger = 0
		
	if happiness < 0:
		happiness = 0
		
	if energy < 0:
		energy = 0

	update_day_label()
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
