extends AnimatedSprite2D

func _on_rad_area_body_entered(body: Node2D) -> void:
	if body.name == "FootArea" or "HeadArea" or "BodyArea" :
		Dialoguemanager.start_dialogue(global_position, [
			"  hello world Your goofy  ",
			"  Test2  "
		])

func _process(delta: float) -> void:
	pass
