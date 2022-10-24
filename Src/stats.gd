extends Node

var save_path = "user://data.save"
var data = {
	"price" : 1,
	"ovens" : 1,
	"balance" : 0,
	"ascends" : 0
}

func _ready():
	get_data()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_data()
		get_tree().quit() # default behavior

func save_data():
	var file = File.new()
	var error = file.open(save_path,File.WRITE)
	if error == OK:
		file.store_string(to_json(data))
		print("saved")
		file.close()
		
func get_data():
	var file = File.new()
	if file.file_exists(save_path):
		file.open(save_path, File.READ)
		data = parse_json(file.get_as_text())
		file.close()
	else:
		printerr("No saved data!")
