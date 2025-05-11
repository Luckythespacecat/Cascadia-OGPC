extends Node

var TimeOut1 = 0
var SkyFinalPos = Vector2(900.0, 500.0)
var mouse_in_settings = false
# These variables and functions are to animate the elements of the main menu.
func _ready() -> void:
	var Seatween = get_tree().create_tween()
	Seatween.tween_property($Sea, "position", Vector2(700, 550), 3).set_trans(Tween.TRANS_QUINT)

	var Landtween = get_tree().create_tween()
	Landtween.tween_property($Island, "position", Vector2(1180, 940), 3).set_trans(Tween.TRANS_QUINT)

	var Skytween = get_tree().create_tween()
	Skytween.tween_property($Sky, "position", Vector2(855.65, 474.5), 3).set_trans(Tween.TRANS_QUART)

	var NametweenPos = get_tree().create_tween()
	NametweenPos.tween_property($Name, "position", Vector2(1100.0, 70.0), 3).set_trans(Tween.TRANS_QUART)

	var PlayButtontweenPos = get_tree().create_tween()
	PlayButtontweenPos.tween_property($"Play Button", "position", Vector2(1020.0, 475.0), 3).set_trans(Tween.TRANS_QUART)

	var CreditsButtonPos = get_tree().create_tween()
	CreditsButtonPos.tween_property($Icon2, "position", Vector2(1700.0, 940.0), 3).set_trans(Tween.TRANS_QUART)

	var SettingsButtonPos = get_tree().create_tween()
	SettingsButtonPos.tween_property($TextBox, "position", Vector2(1500.0, 505.0), 3).set_trans(Tween.TRANS_QUART)

#Initiates the title's animation
	$Name/StretchOut.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_in_settings and Input.is_action_just_pressed("Click"):
		get_tree().change_scene_to_file("res://settings_menu.tscn")

#This creates the background effect of moving opposite of the mouse. The TimeOut1 variable is to track when the
#sky is in position.
	var MouseRelativePosition = -1*(get_viewport().get_mouse_position())
	if TimeOut1 == 1:
		$Sky.global_position = SkyFinalPos.lerp(MouseRelativePosition, delta*1.5)

#Starts the wave's animation as well as continueing the title's
func _on_stretch_out_timeout() -> void:
	TimeOut1 = 1
	print($Sky.global_position)
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

#The function that changes scenes when the play button is clicked.
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://LarryIntroduction.tscn")

func _on_credits_button_down() -> void:
	get_tree().change_scene_to_file("res://credits_menu.tscn")



func _on_button_area_mouse_entered() -> void:
	mouse_in_settings = true


func _on_button_area_mouse_exited() -> void:
	mouse_in_settings = false
