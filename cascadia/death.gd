extends Node2D

var deathOption : String = ""
var death2 = false
var deathScene = load("res://LarryIntroduction.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	condition()
	if Global.toggle == false:
		Global.Died = true
		get_tree().change_scene_to_file("res://LarryIntroduction.tscn")

func condition():
	if Global.Hunger <= 10:
		Global.toggle = false
	else :
		Global.toggle = true
