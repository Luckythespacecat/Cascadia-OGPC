extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 2

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "playerBody" :
		Global.PlayerEnteredTelescope = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "playerBody" :
		Global.PlayerEnteredTelescope = false
