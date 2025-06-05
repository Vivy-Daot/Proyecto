extends Node

var points = 0
@onready var point_label = %Point_label
@onready var texture_progress_bar = %TextureProgressBar


func addPoints():
	points +=1
	print(points)
	point_label.text = str (points) 
	texture_progress_bar.value +=1
	
