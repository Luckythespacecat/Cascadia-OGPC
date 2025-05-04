extends Node2D

func _process(delta: float) -> void:
	choice()

func choice():
	if Input.is_action_just_pressed("Dialogue1"):
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
		"  Look, it worked !  "
		])
	if Input.is_action_just_pressed("Dialogue2"):
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
		"  Hey, this worked2  ! "
		])

func test5():
	pass
