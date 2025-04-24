extends AnimatedSprite2D

func _on_rad_area_body_entered(body: Node2D) -> void:
	if body.name == "playerBody" :
		print("Go on leave the building then...")

func _process(delta: float) -> void:
	pass
