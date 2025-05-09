extends Area2D
@onready var fresa = $"../../Sounds/Fresa"


func ready():
	fresa = get_node("/root/Node/Sounds/Fresa")

func _on_body_entered(body):
	if (body.name == "MainCharacter"):
		queue_free()
		fresa.playing=true
		SingleGameManager.addPoints()
