extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var Seatween = get_tree().create_tween()
	Seatween.tween_property($Sea, "position", Vector2(700, 550), 3).set_trans(Tween.TRANS_QUINT)

	var Landtween = get_tree().create_tween()
	Landtween.tween_property($Island, "position", Vector2(1180, 910), 3).set_trans(Tween.TRANS_QUINT)
	
	var Skytween = get_tree().create_tween()
	Skytween.tween_property($Sky, "position", Vector2(900.0, 500.0), 3).set_trans(Tween.TRANS_QUART)

	var NametweenPos = get_tree().create_tween()
	NametweenPos.tween_property($Name, "position", Vector2(1100.0, 70.0), 3).set_trans(Tween.TRANS_QUART)

	$Name/StretchOut.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_stretch_out_timeout() -> void:
	$Name/AnimationPlayer.play("Stretch")
	$Name/StretchOutFinished.start()
	$Sea/SeaAnimation.play("SeaMove")

func _on_stretch_out_finished_timeout() -> void:
	$Name/AnimationPlayer.stop()

func _on_tween_more_timer_timeout() -> void:
	SlowTweens()

func SlowTweens() :
	var Seatweenlong = get_tree().create_tween()
	Seatweenlong.tween_property($Island, "position", Vector2(513.0, 400), 30).set_trans(Tween.TRANS_QUART)

	var Landtweenlong = get_tree().create_tween()
	Landtweenlong.tween_property($Sea, "position", Vector2(381.0, 400), 30).set_trans(Tween.TRANS_QUART)
