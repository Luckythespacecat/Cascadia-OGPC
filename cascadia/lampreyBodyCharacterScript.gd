extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("Left") :
		position.x -= 3
	if Input.is_action_pressed("Right") :
		position.x += 3
	if Input.is_action_pressed("Up") :
		position.y -= 3
	if Input.is_action_pressed("Down") :
		position.y += 3
