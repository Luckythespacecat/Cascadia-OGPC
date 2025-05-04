extends Node2D

@onready var RockArea = $RockArea
var boatAngle = 0

func _ready():
	pass
	#$AnimatedSprite2D.play()

func _on_order_area_area_entered(area: Area2D) -> void:
	if area.name == "HeadArea" :
		z_index = 5

func _on_order_area_area_exited(area: Area2D) -> void:
	if area.name == "HeadArea" :
		z_index = 0

func _on_rock_area_area_entered(area: Area2D) -> void:
	if area.name == "BoatArea2D":
		boatAngle = Global.boatDirection
		Global.damage = Global.damage + 1
		Global.boatDirection = 0
		Global.BoatInputStop = boatAngle
		
	if area.name == "SwimArea" :
		for i in Global.last_key_pressed :
			if i == "W" :
				Global.NoUp = true
			if i == "A" :
				Global.NoLeft = true
			if i == "S" :
				Global.NoDown = true
			if i == "D" :
				Global.NoRight = true


func _on_rock_area_area_exited(area: Area2D) -> void:
	if area.name == "BoatArea2D":
		Global.BoatInputStop = 10
	if area.name == "SwimArea" :
		Global.NoUp = false
		Global.NoDown = false
		Global.NoRight = false
		Global.NoLeft = false
