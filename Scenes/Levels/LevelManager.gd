extends Node

export(Array, PackedScene) var levelParts
var Player = preload("res://Objets/Player.tscn")

# manage level parts visibility and (instance?)
#GET viewport size.x from Global.gd (autoload)
# levelstart always instantiate at start + the second parts (@ start position.x + viewportX)
var viewportX = Global.VIEWPORT_SIZE.x

func _ready() -> void:
	# levelStart part
	var levelStart = levelParts[0].instance()
	add_child(levelStart)
	
	#instanciate the player at playerstartposition (position 2d)
	var player = Player.instance()
	add_child(player)
	player.position = $PlayerStartPos.position
	
	
	
