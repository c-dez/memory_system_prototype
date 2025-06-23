class_name Brain
extends Node

@onready var label: Label = get_node("Label")
@onready var line_edit: LineEdit = get_node("LineEdit")

const save_path: String = "user://player_stats.save"
var player_stats: Dictionary = {
	"name": "default",
	"crush_level": 0
}

var _min_crush_level: int = 0
# var _max_crush_level: int = 99



func _ready() -> void:
	line_edit.visible = false
	load_data()


func _process(_delta: float) -> void:
	label.text = str(player_stats)


func save() -> void:
	var file := FileAccess.open(save_path, FileAccess.WRITE)

	file.store_var(player_stats)
	print("Saved")


func load_data() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)

		player_stats = file.get_var()
		print("Data loaded")


# TESTING
func _on_button_pressed_plus() -> void:
	player_stats["crush_level"] += 1


func _on_button_pressed_minus() -> void:
	player_stats["crush_level"] -= 1
	if player_stats["crush_level"] < _min_crush_level:
		player_stats["crush_level"] = _min_crush_level
	

func _on_save_pressed() -> void:
	save()


func _on_load_pressed() -> void:
	load_data()


func _on_change_name_pressed() -> void:
	line_edit.visible = true


func _on_ok_pressed() -> void:
	player_stats["name"] = line_edit.text
	line_edit.text = ""
	line_edit.visible = false
