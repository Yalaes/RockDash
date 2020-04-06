extends Node

var VIEWPORT_SIZE: = Vector2()
const GRID_SIZE: = 64

func _ready() -> void:
	VIEWPORT_SIZE = get_viewport().size
