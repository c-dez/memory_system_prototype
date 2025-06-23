class_name Brain
extends Node


var player_name: String = ""
var crush_level: int = 0:
	get:
		return crush_level
	set(value):
		crush_level = clamp(value, 0, 99)

func _ready():
	print(crush_level)
	# crush_level -= 101
	print(crush_level)

	pass