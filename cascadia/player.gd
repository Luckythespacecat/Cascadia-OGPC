extends Node2D

var PlayerPos : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#basic movement if statements
		#Sets the animation to idle if input is stopped
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right") :
		$AnimatedSprite2D.play("Idle")
		# Movement animation, pos and horizantal flip for Left
	if Input.is_action_pressed("Left") :
		Global.PlayerX -= 1
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false
		# Movement animation, pos and horizantal flip for Right
	if Input.is_action_pressed("Right") :
		Global.PlayerX += 1
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true
		#up and down movement
	if Input.is_action_pressed("Down") :
		Global.PlayerY += 1
		$AnimatedSprite2D.play("Run")
	if Input.is_action_pressed("Up") :
		Global.PlayerY -= 1
		$AnimatedSprite2D.play("Run")
		
	#Change the players position accordingly every frame
	Global.PlayerPos = Vector2(Global.PlayerX, Global.PlayerY)
	self.position = Global.PlayerPos
	print(Global.PlayerPos)
	
