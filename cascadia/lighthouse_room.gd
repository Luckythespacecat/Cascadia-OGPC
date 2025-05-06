extends Node2D

@onready var main_scene = preload("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("main_scene set in Inspector:", main_scene)
	if main_scene:
		var inst = main_scene.instantiate()
		print("Can instantiate main_scene:", inst)
	else:
		print("main_scene is NULL!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.PlayerEnteredTelescope == true:
		if Input.is_action_just_pressed("interact") :
			if Global.partNumb == 0:
				Global.partNumb = 1
				$Camera2D.apply_shake()
				$playerBody/AnimatedSprite2D.play("Pick_Up")
				
			elif Global.partNumb == 1 and Global.part1Obtained == true :
				Global.partNumb = 2
				$Camera2D.apply_shake()
				$playerBody/AnimatedSprite2D.play("Pick_Up")
				
			elif Global.partNumb == 2 and Global.part2Obtained == true :
				Global.partNumb = 3
				$Camera2D.apply_shake()
				$playerBody/AnimatedSprite2D.play("Pick_Up")
				
			elif Global.partNumb == 3 and Global.part3Obtained == true :
				print("End of game")

	$Camera2D.position = lerp($Camera2D.position, $playerBody.position, 5 * delta)
	
	if Global.timeOfDay == "Night" :
		$Doorlight.energy = .15
	if Global.timeOfDay == "Day" :
		$Doorlight.energy = .35

func _on_door_area_body_entered(body: Node2D) -> void:
	if body.name == "playerBody":
		Global.SceneJustIn = "Lighthouse"
		print("Scene switching...")
		if main_scene:
			Dialoguemanager.current_line_index = 0
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			print("main_scene is NULL")


func _on_raindrops_finished() -> void:
	$Raindrops.play()
	
#apply_shake()


func _on_animated_sprite_2d_animation_finished() -> void:
	if $playerBody/AnimatedSprite2D.animation == "Pick_Up" :
		$playerBody/AnimatedSprite2D.play("Idle")
