extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Seatween = get_tree().create_tween()
	Seatween.tween_property($Island, "position", Vector2(513.0, 400), 3).set_trans(Tween.TRANS_QUINT)

	var Landtween = get_tree().create_tween()
	Landtween.tween_property($Sea, "position", Vector2(500.0, 400), 3).set_trans(Tween.TRANS_QUINT)

	var Skytween = get_tree().create_tween()
	Skytween.tween_property($Sky, "position", Vector2(760.0, 367.0), 3).set_trans(Tween.TRANS_QUART)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
