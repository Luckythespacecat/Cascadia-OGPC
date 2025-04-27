extends Node2D

var PlayerPos : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")
	Global.larryAppear = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#drown function
	drown()
	# drowning aftermath
		
	
	
	#basic movement if statements
		#Sets the animation to idle if input is stopped
	if not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and (Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right")) and $AnimatedSprite2D.animation != "Drown" :
		if Global.swimming == false :
			$AnimatedSprite2D.play("Idle")
		else: 
			$AnimatedSprite2D.play("SwimIdle")
		# Movement animation, pos and horizantal flip for Left
	if not Input.is_action_pressed("ui_accept")and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Left") and $AnimatedSprite2D.animation != "Drown" :
		Global.PlayerX -= 1.5
		$AnimatedSprite2D.flip_h = false
		if Global.swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
		# Movement animation, pos and horizantal flip for Right
	if not Input.is_action_pressed("ui_accept")  and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Right") and $AnimatedSprite2D.animation != "Drown" :
		Global.PlayerX += 1.5
		$AnimatedSprite2D.flip_h = true
		if Global.swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
		#up and down movement
	if  not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Down") and $AnimatedSprite2D.animation != "Drown" :
		Global.PlayerY += 1.5
		if Global.swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
	if not Input.is_action_pressed("ui_accept") and $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Up") and $AnimatedSprite2D.animation != "Drown" :
		Global.PlayerY -= 1.5
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
	

func drown():
	if Global.swimming == true and $drownTimer.time_left == 0:
		$drownTimer.start()
	if Global.swimming == false:
		$drownTimer.stop()

func _on_drown_timer_timeout() -> void:
	print("DIIIIIIEEEE")
	$AnimatedSprite2D.play("Drown")
	
func _on_t_imer_wait_death_timeout() -> void:
		Global.Dead = true
		$AnimatedSprite2D.play("Idle")
		$TImerWaitDeath.stop()
