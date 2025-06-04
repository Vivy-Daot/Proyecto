extends Node2D

@onready var cherry = load("res://Scenes/collectible.tscn")

func spawn():
	var inst = cherry.instantiate()
	add_child(inst)

func _on_timer_timeout():
	spawn()
	pass # Replace with function body.
