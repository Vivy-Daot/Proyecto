extends Node
@onready var pause_menu = $MainCharacter/CanvasLayer/PauseMenu

@onready var main = $"."
var paused = false

func PauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused 
	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		PauseMenu()
