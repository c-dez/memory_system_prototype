class_name Brain
extends Node

var save_path:String = "user://player_stats.save"

var player_name: String = "Default"
var crush_level: int = 0:
	get:
		return crush_level
	set(value):
		crush_level = clamp(value, 0, 99)

@onready var label:Label = get_node("Label")

func _ready() -> void:
	load_data()
	pass

func _process(_delta: float) -> void:
	label.text = str(crush_level)


func save()->void:
	var file := FileAccess.open(save_path,FileAccess.WRITE)

	file.store_var(player_name)
	file.store_var(crush_level)

	pass


func load_data()->void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)

		player_name = file.get_var()
		crush_level = file.get_var()



# TESTING
func _on_button_pressed_plus() -> void:
	crush_level+=1
	pass # Replace with function body.


func _on_button_pressed_minus() -> void:
	crush_level -=1
	pass # Replace with function body.


func _on_save_pressed() -> void:
	save()
	pass # Replace with function body.


func _on_load_pressed() -> void:
	load_data()
	pass # Replace with function body.
