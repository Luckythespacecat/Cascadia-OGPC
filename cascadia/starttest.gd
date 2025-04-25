extends Node2D

@onready var test_scene = preload("res://main.tscn")

func _ready():
	var s = test_scene.instantiate()
	print("Instantiated:", s)
	add_child(s)
