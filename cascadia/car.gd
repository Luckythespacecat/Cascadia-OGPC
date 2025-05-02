extends Node2D

@onready var CarArea = $CarArea
@onready var flip1

func _ready():
	$CarArea/AnimatedSprite2D.play()
	CarArea.area_entered.connect(_on_area_entered)
	flip()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Area2D":
		Global.damage = Global.damage + 1
		Global.boatDirection = 0
		
	if area.name == "FootArea" or area.name == "HeadArea" or area.name == "BodyArea":
		pass


func flip():
	flip1 = randi_range(1,10)
	if flip1 <= 5:
		$CarArea/AnimatedSprite2D.flip_h = true
	else:
		pass
