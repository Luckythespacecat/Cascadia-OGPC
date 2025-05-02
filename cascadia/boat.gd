extends Node2D

signal inWater

var rand
var animationStarted = false
var justDamaged = false
var damageAnimation = "Fixed"

#Timer for the 'rowing animation'
func _ready(): 
	$Sail.frame = 0
	$AnimatedSprite2D.frame = 0
	$AnimatedSprite2D.play("Fixed")
	$Sail.play("Front")
	$Timer.start()
	Global.PlayerPos = global_position
	position = Global.NewBoatPos
func BoatDamage():
	if Global.damage == 0 :
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		damageAnimation = "Fixed"
	elif Global.damage == 1:
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		damageAnimation = "Damaged1"
	elif Global.damage == 2 : 
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		damageAnimation = "Damaged2"
	elif Global.damage == 3 : 
		$AnimatedSprite2D.frame = 0
		$Sail.frame = 0
		damageAnimation = "Damaged3"
	else:
		pass
		
func boatMovement():
	Global.boatDirection += 1
	Global.SailMovedE = true
	if Global.boatDirection > 8:
		Global.boatDirection = 1
	elif Global.boatDirection < 1:
		Global.boatDirection = 8


func boatMovement2():
	Global.boatDirection -= 1
	Global.SailMovedQ = true
	if Global.boatDirection > 8:
		Global.boatDirection = 1
	elif Global.boatDirection < 1:
		Global.boatDirection = 8



#function to choose which rowing speed will occur
func _process(delta: float) -> void: 
	
	$AnimatedSprite2D.play(damageAnimation)
	
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
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = true
			$Sail.play("AngledFront")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY += .25 * Global.wind
	#leftup
	if Global.boatDirection == 7 :
		position.x -= .25 * Global.wind
		position.y -= .25 * Global.wind
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = false
			$Sail.play("AngledBack")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY -= .25 * Global.wind
	#rightdown
	if Global.boatDirection == 3 :
		position.x += .25 * Global.wind
		position.y += .25 * Global.wind
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = false
			$Sail.play("AngledFront")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25 * Global.wind
			Global.PlayerY += .25 * Global.wind
	#rightup
	if Global.boatDirection == 5 :
		position.x += .25 * Global.wind
		position.y -= .25 * Global.wind
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = true
			$Sail.play("AngledBack")
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25 * Global.wind
			Global.PlayerY -= .25 * Global.wind
	#right
	if Global.boatDirection == 4 :
		position.x += .25  * Global.wind
		position.y += 0  
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = true
			$Sail.play("Side")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += .25  * Global.wind
			Global.PlayerY += 0
	#up
	if Global.boatDirection == 6 :
		position.x += 0
		position.y -= .25 * Global.wind
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = false
			$Sail.play("Back")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += 0
			Global.PlayerY -= .25 * Global.wind
	#left
	if Global.boatDirection == 8 :
		position.x -= .25 * Global.wind
		position.y += 0
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = false
			$Sail.play("Side")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX -= .25 * Global.wind
			Global.PlayerY += 0
	#down
	if Global.boatDirection == 2 :
		position.x += 0
		position.y += .25 * Global.wind
		if animationStarted == false:
			$Sail.frame = 0
			$AnimatedSprite2D.frame = 0
			$Sail.flip_h = false
			$Sail.play("Front")
			$AnimatedSprite2D.play()
			animationStarted = true
		if Global.swimming == false and Global.onBoat == true:
			Global.PlayerX += 0
			Global.PlayerY += .25 * Global.wind

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" : 
		Global.swimming = false
		Global.onBoat = true
		if area.name == "RockArea" : 
			justDamaged = true

		

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" : 
		if $Player/AnimatedSprite2D.animation != "Splash" and $Player/AnimatedSprite2D.animation != "SwimIdle" :
			Global.swimming = true
			Global.onBoat = false
			inWater.emit()

func _on_sail_area_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" : 
		$Player.z_index = 1


func _on_sail_area_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" : 
		$Player.z_index = 3

func AdjustSailAction() :
	for area in $SailAdjust.get_overlapping_areas() :
		if area.name == "FootArea" : 
			Global.AdjustSail = true

	if  Global.TalkingToBarry == false and Global.AdjustSail == true and Input.is_action_just_pressed("boatClockwise") and Global.onBoat == true:
		$Player/AnimatedSprite2D.play("Pick_Up")
		animationStarted = false
		boatMovement()


	if Global.TalkingToBarry == false and Global.AdjustSail == true and Input.is_action_just_pressed("boatcounterClockwise") and Global.onBoat == true:
		$Player/AnimatedSprite2D.play("Pick_Up")
		animationStarted = false
		boatMovement2()
