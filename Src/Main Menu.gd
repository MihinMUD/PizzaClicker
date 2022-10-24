extends TextureRect

func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Interface.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
	


func _on_Help_pressed():
	get_tree().change_scene("res://Scenes/Help.tscn")
