extends Node2D

var PlayerPos : Vector2
var Swimming = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Swimming = Global.swimming
	
	#basic movement if statements
		#Sets the animation to idle if input is stopped
	if $AnimatedSprite2D.animation != "Splash" and (Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right")) :
		if Swimming == false :
			$AnimatedSprite2D.play("Idle")
		else: 
			$AnimatedSprite2D.play("SwimIdle")
		# Movement animation, pos and horizantal flip for Left
	if $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Left") :
		Global.PlayerX -= 1.5
		$AnimatedSprite2D.flip_h = false
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
		# Movement animation, pos and horizantal flip for Right
	if $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Right") :
		Global.PlayerX += 1.5
		$AnimatedSprite2D.flip_h = true
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
		#up and down movement
	if $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Down") :
		Global.PlayerY += 1.5
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swimming")
	if $AnimatedSprite2D.animation != "Splash" and Input.is_action_pressed("Up") :
		Global.PlayerY -= 1.5
		if Swimming == false: 
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
