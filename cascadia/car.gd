extends Node2D

@onready var CarArea = $CarArea

func _ready():
	$CarArea/AnimatedSprite2D.play()
	CarArea.area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Area2D":
		Global.damage = Global.damage + 1
		Global.boatDirection = 0
		
	if area.name == "FootArea" or area.name == "HeadArea" or area.name == "BodyArea":
		pass
