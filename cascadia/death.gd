extends Node2D

var deathOption : String = ""
var death2 = false
const death4 = preload("res://main.tscn")


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	condition()
	if Global.toggle == false:
		death2 = true
		Global.PlayerX = 0.0
		Global.PlayerY = 0.0
		Dialoguemanager.start_dialogue(Vector2(Global.PlayerX + 100, Global.PlayerY), [
		"  Um, you forgot to eat, or your boat broke  ",
		"  oh well!  ",
		"  your eternal damnation is reliving the worst day of your life  ",
		"  Have fun ! ! !  " 
		])
		Global.toggle = true
		death2 = false
		Global.damage = 0
		get_tree().change_scene_to_packed(death4)



func condition():
	if Global.damage == 3:
		Global.toggle = false
	if Global.Hunger <= 10:
		Global.toggle = false
