extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Dialoguemanager.is_dialogue_active == true :
		Global.deleteText == true
			
	if Dialoguemanager.is_dialogue_active == false :
		Global.deleteText == false


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.name == "playerBody" :

		if Global.part3Obtained == true :
			$YouWin.start()
			Dialoguemanager.start_dialogue( Vector2(global_position.x,global_position.y - 50 ), [
			"  Thanks for calling in  ",
			"  Help is one the way  ",
			])
		else: Dialoguemanager.start_dialogue( Vector2(global_position.x,global_position.y - 50 ), [
			"  Error contacting server  ",
			"  Major compenent missing: Satelite Dish  ",
			"  Refer to lighthouse intstruction manual to troubleshoot  "
		])
