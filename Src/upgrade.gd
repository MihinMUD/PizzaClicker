extends Button

export var item = "Mushroom"
export(Texture) var image
export var price = 10
export var value = 1
export(String, "Topping", "Oven") var upgrade_type
onready var stats = get_node("/root/stats")
var topping_format = "%s - %s$ \n(+%s price)"
var oven_format = "%s - %s$ \n(+%s pizza per 5secs)"
func _ready():
	$MarginContainer/TextureRect.texture = image
	if upgrade_type == "Topping":
		$MarginContainer/Label.text = topping_format % [item, price, value] 
	elif upgrade_type == "Oven":
		$MarginContainer/Label.text = oven_format % [item, price, value] 
		
func _on_Upgrade_pressed():
	if upgrade_type == "Topping" and stats.balance > price - 1:
		stats.price += value
		stats.balance -= price
	if upgrade_type == "Oven" and stats.balance > price - 1:
		stats.ovens += value
		stats.balance -= price
