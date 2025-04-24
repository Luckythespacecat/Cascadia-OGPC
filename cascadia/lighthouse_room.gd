extends Node2D

var next_scene = preload("res://main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position = lerp($Camera2D.position, $playerBody.position, 5 * delta)
	
	if Global.timeOfDay == "Night" :
		$Doorlight.energy = .2
	if Global.timeOfDay == "Day" :
		$Doorlight.energy = .35


func _on_door_area_body_entered(body: Node2D) -> void:
	if body.name == "playerBody" :
		get_tree().change_scene_to_packed(next_scene)
		
