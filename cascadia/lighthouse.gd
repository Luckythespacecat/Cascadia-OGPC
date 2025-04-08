extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right") :
		pass
		#$AnimatedSprite2D.
	for i in $Area2D2.get_overlapping_areas():
		if(i.get_collision_layer() == 2):
			print("HEY IT WORKED")
		pass
