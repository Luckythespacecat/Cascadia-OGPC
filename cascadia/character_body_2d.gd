extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready() -> void:
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vector * SPEED
	if $AnimatedSprite2D.animation != "Pick_Up":
		if (Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right")) :
			$AnimatedSprite2D.play("Idle")
	
		if Input.is_action_pressed("ui_left"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("Run")
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("Run")
		if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
			$AnimatedSprite2D.play("Run")
	
		move_and_slide()
