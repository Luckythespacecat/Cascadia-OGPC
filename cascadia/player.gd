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
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right") :
		if Swimming == false :
			$AnimatedSprite2D.play("Idle")
		else: 
			$AnimatedSprite2D.play("Swim")
		# Movement animation, pos and horizantal flip for Left
	if Input.is_action_pressed("Left") :
		Global.PlayerX -= 1.5
		$AnimatedSprite2D.flip_h = false
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swim")
		# Movement animation, pos and horizantal flip for Right
	if Input.is_action_pressed("Right") :
		Global.PlayerX += 1.5
		$AnimatedSprite2D.flip_h = true
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swim")
		#up and down movement
	if Input.is_action_pressed("Down") :
		Global.PlayerY += 1.5
		if Swimming == false:
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swim")
	if Input.is_action_pressed("Up") :
		Global.PlayerY -= 1.5
		if Swimming == false: 
			$AnimatedSprite2D.play("Run")
		else :
			$AnimatedSprite2D.play("Swim")
		
	
	#Change the players position accordingly every frame
	Global.PlayerPos = Vector2(Global.PlayerX, Global.PlayerY)
	global_position = Global.PlayerPos
	print(Global.PlayerPos)

func _on_area_2d_area_exited(area: Area2D) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
