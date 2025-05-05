extends Node2D

var PlayerPos : Vector2
var stopAnimation : bool = false
var enteredFish = false
var boattriggeronce =  false
var boattriggeronce2 =  false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")
	Global.larryAppear = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.foodCutscene == true:
		$AnimatedSprite2D.play("SwimIdle")
	if enteredFish == true:
		if Input.is_action_just_pressed("interact") and stopAnimation == false :
			stopAnimation = true
			$AnimatedSprite2D.play("Dive")
			$Eat.play()
	if $AnimatedSprite2D.animation == "Dive":
		$drownTimer.stop()
	#drown function
	drown()
	# drowning aftermath
	if Global.onBoat == true and boattriggeronce ==  false:
		$Swim.stop()
		$Walking.play()
		boattriggeronce = true
		boattriggeronce2 = false
	if Global.onBoat == false and boattriggeronce2 ==  false:
		$Walking.stop()
		$Swim.play()
		boattriggeronce2 = true
		boattriggeronce = false
		
	if Global.TalkingToBarry == true or Global.AtGreenRock == true:
		$drownTimer.stop()
		if Global.onBoat == true :
			$AnimatedSprite2D.play("Idle")
		if Global.onBoat == false :
			$AnimatedSprite2D.play("SwimIdle")
	
	if Global.TalkingToBarry == false and Global.AtGreenRock == false  and Global.tutorial == true:
	#basic movement if statements
		#Sets the animation to idle if input is stopped
		if Global.foodCutscene == false and stopAnimation == false and not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and (Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right")) and $AnimatedSprite2D.animation != "Drown" :
			if Global.swimming == false :
				$AnimatedSprite2D.play("Idle")
				$Walking.stop()
			else: 
				$AnimatedSprite2D.play("SwimIdle")
				$Swim.stop()
		# Movement animation, pos and horizantal flip for Left
		if Global.NoLeft == false and Global.foodCutscene == false and stopAnimation == false and not Input.is_action_pressed("ui_accept")and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Left") and $AnimatedSprite2D.animation != "Drown" :
			Global.PlayerX -= 2
			$AnimatedSprite2D.flip_h = false
			if Global.swimming == false:
				$AnimatedSprite2D.play("Run")
			else :
				$AnimatedSprite2D.play("Swimming")
		# Movement animation, pos and horizantal flip for Right
		if Global.NoRight == false and Global.foodCutscene == false and stopAnimation == false and not Input.is_action_pressed("ui_accept")  and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Right") and $AnimatedSprite2D.animation != "Drown" :
			Global.PlayerX += 2
			$AnimatedSprite2D.flip_h = true
			if Global.swimming == false:
				$AnimatedSprite2D.play("Run")
			else :
				$AnimatedSprite2D.play("Swimming")
		#up and down movement
		if Global.NoDown == false and Global.foodCutscene == false and stopAnimation == false and not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Down") and $AnimatedSprite2D.animation != "Drown" :
			Global.PlayerY += 2
			if Global.swimming == false:
				$AnimatedSprite2D.play("Run")
			else :
				$AnimatedSprite2D.play("Swimming")
		if Global.NoUp == false and Global.foodCutscene == false and stopAnimation == false and not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Up") and $AnimatedSprite2D.animation != "Drown" :
			Global.PlayerY -= 2
			if Global.swimming == false: 
				$AnimatedSprite2D.play("Run")
			else :
				$AnimatedSprite2D.play("Swimming")
	
	#Change the players position accordingly every frame
	Global.PlayerPos = Vector2(Global.PlayerX, Global.PlayerY)
	global_position = Global.PlayerPos
	#print(Global.PlayerPos)

func _on_area_2d_area_exited(area: Area2D) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass

func _on_boat_in_water() -> void:
	$AnimatedSprite2D.play("Splash")

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "Splash" :
		$AnimatedSprite2D.play("SwimIdle")
	if $AnimatedSprite2D.animation == "Pick_Up" :
		$AnimatedSprite2D.play("Idle")
		Global.AdjustSail = false
	if $AnimatedSprite2D.animation == "Drown"  :
		$TImerWaitDeath.start()
	
	if $AnimatedSprite2D.animation == "Dive" :
		stopAnimation = false
		Global.Hunger += 5
		$drownTimer.start()

func drown():
	if Global.swimming == true and $drownTimer.time_left == 0 and Global.tutorial == true:
		$drownTimer.start()
	if Global.swimming == false:
		$drownTimer.stop()

func _on_drown_timer_timeout() -> void:
	print("DIIIIIIEEEE")
	$AnimatedSprite2D.play("Drown")
func _on_t_imer_wait_death_timeout() -> void:
		Global.Dead = true
		$TImerWaitDeath.stop()
		$AnimatedSprite2D.pause()

func _on_hunger_timer_timeout() -> void:
	Global.Hunger -= 2

func _on_swim_area_area_entered(area: Area2D) -> void:
	if area.name == "FishArea" and Global.onBoat == false: 
		enteredFish = true
	if area.name == "LarryArea" and Global.onBoat == false: 
		z_index = -1
func _on_swim_area_area_exited(area: Area2D) -> void:
	if area.name == "FishArea" and Global.onBoat == false: 
		enteredFish = false
	if area.name == "LarryArea" and Global.onBoat == false: 
		z_index = 1
