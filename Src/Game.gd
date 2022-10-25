extends TextureRect

onready var stats = get_node("/root/stats")

func _process(_delta):
	$MarginContainer/HBoxContainer/PizzaStats/Balance.text = "Balance: " + str(stats.data["balance"])
	$MarginContainer/HBoxContainer/PizzaStats/Ovens.text = "Ovens: " + str(stats.data["ovens"])
	$MarginContainer/HBoxContainer/PizzaStats/Price.text = "Price per pizza: " + str(stats.data["price"])
	if stats.data["balance"] > 1000000:
		$MarginContainer/HBoxContainer/PizzaStats/Ascend.show()
	if stats.data["ascends"] > 20:
		get_tree().change_scene("res://Scenes/Won.tscn")
		stats.data = {
			"asecnds": 0,
			"balance": 0,
			"price": 1,
			"ovens": 1
		}
func _on_Pizza_pressed():
	stats.data["balance"] += stats.data["price"]

func _on_Timer_timeout():
	stats.data["balance"] += stats.data["ovens"] * stats.data["price"]

func _on_Ascend_pressed():
	$AscendDialog.popup()

func _on_AscendDialog_confirmed():
	stats.data["ascends"] += 1
	stats.data["balance"] = 0
	stats.data["price"] = 1
	stats.data["ovens"] = stats.data["ascends"] * 50
	$MarginContainer/HBoxContainer/PizzaStats/Ascend.hide()
