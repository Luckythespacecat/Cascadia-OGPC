extends AnimatedSprite2D

func _on_rad_area_body_entered(body: Node2D) -> void:
	if body.name == "playerBody" :
		pass

func _process(delta: float) -> void:
	pass
