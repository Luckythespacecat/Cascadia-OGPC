extends Node2D

@onready var RockArea = $RockArea

func _ready():
	pass
	$AnimatedSprite2D.play()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Area2D":
		Global.damage = Global.damage + 1
		Global.boatDirection = 0
		
	if area.name == "FootArea" or area.name == "HeadArea" or area.name == "BodyArea":
		pass 
		#Nathan take care of it the player shouldn't move when hitting a rock
		#and I couldn't find an easy way to do that with our movement system


func _on_order_area_area_entered(area: Area2D) -> void:
	if area.name == "HeadArea" :
		z_index = 5

func _on_order_area_area_exited(area: Area2D) -> void:
	if area.name == "HeadArea" :
		z_index = 0


func _on_rock_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
