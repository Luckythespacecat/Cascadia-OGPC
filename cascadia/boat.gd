extends Node2D

signal inWater

var rand
#Timer for the 'rowing animation'
func _ready(): 
	$AnimatedSprite2D.play("Fixed")
	$Sail.play("Front")
	$Timer.start()
	Global.PlayerPos = global_position
	position = Global.NewBoatPos
	
func BoatDamage():
	if Global.damage == 0 :
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play("Fixed")
	elif Global.damage == 1:
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play("Damaged1")
	elif Global.damage == 2: 
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play("Damaged2")
	elif Global.damage == 3: 
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play("Damaged3")
	else:
		pass
		
func boatMovement():
	Global.boatDirection += 1
	Global.SailMovedE = true
	if Global.boatDirection > 8:
		Global.boatDirection = 1
	elif Global.boatDirection < 1:
		Global.boatDirection = 8
	$AnimatedSprite2D.frame = 0
	$Sail.frame = 0
	$AnimatedSprite2D.play()
	$Sail.play()

func boatMovement2():
	Global.boatDirection -= 1
	Global.SailMovedQ = true
	if Global.boatDirection > 8:
		Global.boatDirection = 1
	elif Global.boatDirection < 1:
		Global.boatDirection = 8
	$AnimatedSprite2D.frame = 0
	$Sail.frame = 0
	$AnimatedSprite2D.play()
	$Sail.play()


#function to choose which rowing speed will occur
func _process(delta: float) -> void: 
	AdjustSailAction()
	
	BoatDamage()

	Global.boatPos = position
	if $Player/AnimatedSprite2D.animation != "Splash" :
		sailMovement()

func sailMovement():
	#leftdown
	if Global.boatDirection == 1 :
		position.x -= .25 * Global.wind
		position.y += .25 * Global.wind
		$Sail.flip_h = true
		$Sail.play("AngledFront")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY += .25 * Global.wind
	#leftup
	if Global.boatDirection == 7 :
		position.x -= .25 * Global.wind
		position.y -= .25 * Global.wind
		$Sail.flip_h = false
		$Sail.play("AngledBack")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY -= .25 * Global.wind
	#rightdown
	if Global.boatDirection == 3 :
		position.x += .25 * Global.wind
		position.y += .25 * Global.wind
		$Sail.flip_h = false
		$Sail.play("AngledFront")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25 * Global.wind
			Global.PlayerY += .25 * Global.wind
	#rightup
	if Global.boatDirection == 5 :
		position.x += .25 * Global.wind
		position.y -= .25 * Global.wind
		$Sail.flip_h = true
		$Sail.play("AngledBack")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25 * Global.wind
			Global.PlayerY -= .25 * Global.wind
	#right
	if Global.boatDirection == 4 :
		position.x += .25  * Global.wind
		position.y += 0  
		$Sail.flip_h = true
		$Sail.play("Side")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25  * Global.wind
			Global.PlayerY += 0
	#up
	if Global.boatDirection == 6 :
		position.x += 0
		position.y -= .25 * Global.wind
		$Sail.flip_h = false
		$Sail.play("Back")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += 0
			Global.PlayerY -= .25 * Global.wind
	#left
	if Global.boatDirection == 8 :
		position.x -= .25 * Global.wind
		position.y += 0
		$Sail.flip_h = false
		$Sail.play("Side")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY += 0
	#down
	if Global.boatDirection == 2 :
		position.x += 0
		position.y += .25 * Global.wind
		$Sail.flip_h = false
		$Sail.play("Front")
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += 0
			Global.PlayerY += .25 * Global.wind

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" : 
		Global.swimming = false
		Global.onBoat = true
		

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" : 
		if $Player/AnimatedSprite2D.animation != "Splash" and $Player/AnimatedSprite2D.animation != "SwimIdle" :
			Global.swimming = true
			Global.onBoat = false
			inWater.emit()

func _on_sail_area_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" : 
		$Player.z_index = 2


func _on_sail_area_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" : 
		$Player.z_index = 4

func AdjustSailAction() :
	for area in $SailAdjust.get_overlapping_areas() :
		if area.name == "FootArea" : 
			Global.AdjustSail = true

	if Global.AdjustSail == true and Input.is_action_just_pressed("boatClockwise") :
		$Player/AnimatedSprite2D.play("Pick_Up")
		boatMovement()

		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play()
		$Sail.play()
		
	if Global.AdjustSail == true and Input.is_action_just_pressed("boatcounterClockwise") :
		$Player/AnimatedSprite2D.play("Pick_Up")
		boatMovement2()

		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		$AnimatedSprite2D.play()
		$Sail.play()
