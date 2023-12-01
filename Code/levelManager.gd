extends Node2D


var coins_collected = 0;

func add_coins(amount):
	coins_collected += amount
	$UI/TextureRect/Label.text = str(coins_collected)
	
func update_fuel_ui(value):
	$UI/FuelIndicator/ProgressBar.value = value
