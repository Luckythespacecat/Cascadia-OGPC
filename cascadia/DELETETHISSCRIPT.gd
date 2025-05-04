extends Node2D

var test = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if test == false :
		Dialoguemanager2.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
		"  Option 2: Dialogue2 (Press 'x')",
		])
		test = true
