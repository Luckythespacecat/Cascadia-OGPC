extends Node2D

signal inWater



var rand
#Timer for the 'rowing animation'
func _ready(): 
	$AnimatedSprite2D.play("default")
	$Sail.play("Front")
	$Timer.start()

func boatMovement():
	if Input.is_action_just_pressed("boatcounterClockwise"):
		Global.boatDirection += 1
		if Global.boatDirection > 8:
			Global.boatDirection = 1
		elif Global.boatDirection < 1:
			Global.boatDirection = 8
	if Input.is_action_just_pressed("boatClockwise"):
		Global.boatDirection -= 1
		if Global.boatDirection > 8:
			Global.boatDirection = 1
		elif Global.boatDirection < 1:
			Global.boatDirection = 8

#function to choose which rowing speed will occur
func _process(delta: float) -> void: 
	if $Player/AnimatedSprite2D.animation != "Splash" :
		sailMovement()
	boatMovement()
#Ensure boat follows player - does nothing
func randomgen(): 
	rand = randi_range(0, 1)


func sailMovement():
	#leftdown
	if Global.boatDirection == 1 :
		position.x -= .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY += .25
			
	#leftup
	if Global.boatDirection == 7 :
		position.x -= .25
		position.y -= .25
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY -= .25
	#rightdown
	if Global.boatDirection == 3 :
		position.x += .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY += .25
	#rightup
	if Global.boatDirection == 5 :
		position.x += .25
		position.y -= .25
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY -= .25
	#right
	if Global.boatDirection == 4 :
		position.x += .25
		position.y += 0
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY += 0
	#up
	if Global.boatDirection == 6 :
		position.x += 0
		position.y -= .25
		if Global.swimming == false:
			Global.PlayerX += 0
			Global.PlayerY -= .25
	#left
	if Global.boatDirection == 8 :
		position.x -= .25
		position.y += 0
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY += 0
	#down
	if Global.boatDirection == 2 :
		position.x += 0
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX += 0
			Global.PlayerY += .25

func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.swimming = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	if $Player/AnimatedSprite2D.animation != "Splash" and $Player/AnimatedSprite2D.animation != "SwimIdle" :
		Global.swimming = true
		inWater.emit()
