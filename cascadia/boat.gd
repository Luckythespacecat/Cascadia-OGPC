extends Node2D

signal inWater

var rand
#Timer for the 'rowing animation'
func _ready(): 
	$AnimatedSprite2D.play("default")
	$Sail.play("Front")
	$Timer.start()

#function to choose which rowing speed will occur
func _process(delta: float) -> void: 
	if $Player/AnimatedSprite2D.animation != "Splash" :
		sailMovement()
	
#Ensure boat follows player - does nothing
func randomgen(): 
	rand = randi_range(0, 1)

func sailMovement():
	if Global.boatDirection == "LeftDown" :
		position.x -= .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY += .25
			
	if Global.boatDirection == "LeftUp" :
		position.x -= .25
		position.y -= .25
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY -= .25

	if Global.boatDirection == "RightDown" :
		position.x += .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY += .25

	if Global.boatDirection == "RightUp" :
		position.x += .25
		position.y -= .25
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY -= .25

func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.swimming = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	if $Player/AnimatedSprite2D.animation != "Splash" and $Player/AnimatedSprite2D.animation != "SwimIdle" :
		Global.swimming = true
		inWater.emit()
