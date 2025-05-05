extends Node2D

@onready var CarArea = $CarArea
@onready var flip1
var boatAngle = 0
var addLater = 0
func _ready():
	$CarArea/AnimatedSprite2D.play()
	flip()

func flip():
	flip1 = randi_range(1,10)
	if flip1 <= 5:
		$CarArea/AnimatedSprite2D.flip_h = true
	else:
		pass


func _on_car_area_area_entered(area: Area2D) -> void:
	if area.name == "BoatArea2D":
		$HitHurt3.play()
		boatAngle = Global.boatDirection
		Global.damage = Global.damage + 1
		Global.boatDirection += 4
		addLater = Global.boatDirection
		if Global.boatDirection > 8:
			Global.boatDirection = addLater - 8
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


func _on_car_area_area_exited(area: Area2D) -> void:
	if area.name == "BoatArea2D":
		Global.BoatInputStop = 15
	if area.name == "SwimArea" :
		Global.NoUp = false
		Global.NoDown = false
		Global.NoRight = false
		Global.NoLeft = false
