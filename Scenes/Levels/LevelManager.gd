extends Node

#Always "res://Scenes/Levels/LevelStart.tscn" at levelParts[0]
# then levelParts 1, 2 ,3 etc
export(Array, PackedScene) var levelParts 


var Player = preload("res://Objets/Player.tscn")
var player

# manage level parts visibility and (instance?)
#GET viewport size.x from Global.gd (autoload)
# levelstart always instantiate at start + the second parts (@ start position.x + viewportX)

#DEBUG
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var _s = get_tree().reload_current_scene()

func _ready() -> void:
	init_level() 
func init_level() -> void:
	###instanciate the player and levelPart 0 and 1		
	#instanciate the player at playerstartposition (position 2d)
	player = Player.instance()
	add_child(player)
	player.position = $PlayerStartPos.position
	
	# levelStart (levelpart 0)
	var levelStart = levelParts[0].instance()
	add_child(levelStart)
	
	# levelPart 1
	var levelPart = levelParts[1].instance()
	add_child(levelPart)
	levelPart.position.x = Global.VIEWPORT_SIZE.x 
	
	# levelPart 1
	var levelPart1 = levelParts[2].instance()
	add_child(levelPart1)
	levelPart1.position.x = Global.VIEWPORT_SIZE.x * 2

func spawn_level_part() -> void:
	pass
