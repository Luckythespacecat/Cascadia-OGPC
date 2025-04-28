extends Node

var TimeOut1 = 0
var SkyFinalPos = Vector2(900.0, 500.0)

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

	var PlayButtontweenPos = get_tree().create_tween()
	PlayButtontweenPos.tween_property($Icon, "position", Vector2(1150.0, 550.0), 3).set_trans(Tween.TRANS_QUART)


	$Name/StretchOut.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var MouseRelativePosition = get_viewport().get_mouse_position() + SkyFinalPos
	if TimeOut1 == 1:
		$Sky.global_position = SkyFinalPos - SkyFinalPos.lerp(MouseRelativePosition, delta)
	pass
func _on_stretch_out_timeout() -> void:
	TimeOut1 = 1
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


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://LarryIntroduction.tscn")
