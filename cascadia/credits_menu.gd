extends Control
@onready var exit_button = $"MarginContainer/VBoxContainer/Exit Button" as Button

func _ready():
	exit_button.button_down.connect(exit_pressed)

func exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
