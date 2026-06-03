extends Control

var hunger = 50
@onready var hunger_label = $HungerLabel

func _ready():
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_day_label()
	update_money_label()

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
	
	money += happiness

	update_day_label()
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_money_label()


var money = 100
@onready var money_label = $MoneyLabel

func update_money_label():
	money_label.text = "Money: $" + str(money)


func _on_brush_button_pressed():

	happiness += 15
	
	if happiness > 100:
		happiness = 100
		
	energy -= 5
	
	if energy < 0:
		energy = 0
		
	update_happiness_label()
	update_energy_label()


func _on_rest_button_pressed():

	energy += 20
	
	if energy > 100:
		energy = 100
		
	hunger -= 5
	
	if hunger < 0:
		hunger = 0
		
	update_energy_label()
	update_hunger_label()



func _on_train_button_pressed():

	money += 25
	
	energy -= 15
	hunger -= 10
	happiness += 5
	
	if energy < 0:
		energy = 0
		
	if hunger < 0:
		hunger = 0
		
	if happiness > 100:
		happiness = 100
		
	update_money_label()
	update_energy_label()
	update_hunger_label()
	update_happiness_label()
