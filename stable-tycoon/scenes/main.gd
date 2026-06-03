extends Control

var hunger = 50
@onready var hunger_label = $HungerLabel

func _ready():
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_day_label()
	update_money_label()
	update_health_label()

func update_hunger_label():
	hunger_label.text = "Hunger: " + str(hunger)

func _on_feed_button_pressed():

	if game_over:
		update_status("Game over. Restart to play again.")
		return
		
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
	
	update_status("You fed the horse!")
		
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

@onready var status_label = $StatusLabel

func update_day_label():
	day_label.text = "Day: " + str(day)

func _on_end_day_button_pressed():
	
	if game_over:
		update_status("Game over. Restart to play again.")
		return
		
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
	
	if hunger <= 20:
		health -= 15
		
	if energy <= 20:
		health -= 10
		
	if happiness <= 20:
		health -= 10
	
	if health < 0:
		health = 0
	
	if health <= 30:
		update_status("Your horse is getting sick!")
	
	update_status("A new day begins.")
	
	if health <= 0:
		game_over = true
		update_status("Game over! Your horse became too sick.")
		
	random_daily_event()

	update_day_label()
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_money_label()
	update_health_label()


var money = 100
@onready var money_label = $MoneyLabel

func update_money_label():
	money_label.text = "Money: $" + str(money)


func _on_brush_button_pressed():

	if game_over:
		update_status("Game over. Restart to play again.")
		return
	
	happiness += 15
	
	if happiness > 100:
		happiness = 100
		
	energy -= 5
	
	if energy < 0:
		energy = 0
	
	update_status("You brushed the horse!")
		
	update_happiness_label()
	update_energy_label()


func _on_rest_button_pressed():

	if game_over:
		update_status("Game over. Restart to play again.")
		return
		
	energy += 20
	
	if energy > 100:
		energy = 100
		
	hunger -= 5
	
	if hunger < 0:
		hunger = 0
	
	update_status("Your horse rested.")
		
	update_energy_label()
	update_hunger_label()


func _on_train_button_pressed():

	if game_over:
		update_status("Game over. Restart to play again.")
		return
		
	if energy < 15:
		update_status("Your horse is too tired to train.")
		return
	
	if hunger < 10:
		update_status("Your horse is too hungry to train.")
		return
	
	money += 25
	energy -= 15
	hunger -= 10
	happiness += 5
	
	if happiness > 100:
		happiness = 100
		
	update_money_label()
	update_energy_label()
	update_hunger_label()
	update_happiness_label()
	update_status("Your horse trained and earned $25!")
	
func update_status(message):
	status_label.text = message
	
var health = 100
@onready var health_label = $HealthLabel

func update_health_label():
	health_label.text = "Health: " + str(health)


func _on_restart_button_pressed() -> void:

	game_over = false
	
	day = 1
	money = 100
	hunger = 50
	happiness = 70
	energy = 80
	health = 100
	
	update_day_label()
	update_money_label()
	update_hunger_label()
	update_happiness_label()
	update_energy_label()
	update_health_label()
	update_status("New game started!")

var game_over = false

func random_daily_event():

	var event = randi_range(1, 4)
	if event == 1:
		money += 20
		update_status("A rider tipped you $20!")
	elif event == 2:
		money -= 15
		update_status("You had to buy extra hay. -$15")
	elif event == 3:
		happiness += 10
		if happiness > 100:
			happiness = 100
		update_status("Your horse enjoyed extra pasture time!")
	else:
		update_status("A quiet day at the stable.")
