extends TextureRect

onready var stats = get_node("/root/stats")

func _process(_delta):
	$HBoxContainer/PizzaStats/Balance.text = "Balance: " + str(stats.balance)
	$HBoxContainer/PizzaStats/Ovens.text = "Ovens: " + str(stats.ovens)
	$HBoxContainer/PizzaStats/Price.text = "Price per pizza: " + str(stats.price)
	

func _on_Pizza_pressed():
	stats.balance += stats.price


func _on_Timer_timeout():
	stats.balance += stats.ovens * stats.price
