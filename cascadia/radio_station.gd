extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "FootArea" or "HeadArea" or "BodyArea" :
		Dialoguemanager.start_dialogue( Vector2(global_position.x,global_position.y - 50 ), [
			"  hello world Your goofy  ",
			"  Test2  "
		])
