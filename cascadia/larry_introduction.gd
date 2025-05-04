extends Node2D

const mainScene = preload("res://main.tscn")

var thispartisdone = false

func _ready() -> void:
	pass

func ReSetupScene() :
	Global.boatDirection = 0
	Global.PlayerY += 10
	Global.swimming = false
	$SceneReset.start()
	print("Timer started")
	Global.larryAppear = 1

func _process(delta: float) -> void:
	
	if Dialoguemanager.current_line_index == 0 : 
		$CanvasLayer/Sprite2D.position = lerp($CanvasLayer/Sprite2D.position, Vector2(913.0, 850.0), delta / 4)

	if Input.is_action_just_pressed("advance_dialogue") or Dialoguemanager.current_line_index != 0 :
		$CanvasLayer/Sprite2D.position = lerp($CanvasLayer/Sprite2D.position, Vector2(936.0, 1127.0), delta / 2)

	if thispartisdone == false :
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x - 25, Global.textPos.y - 40), [
		"  Hey you, its about time you woke up  ",
		"  The names Larry  ",
		"  Larry the Lamprey, that is!  ",
		"  You're one of the only survivors.  ",
		"  From what?  ",
		"  You must've got hit hard.  ",
		"  I guess I'll help you around,  ",
		"  even though I'm most likely...  ",
		"  a figment of your imagination!  "
		])
	
	if Dialoguemanager.current_line_index == 8 and Dialoguemanager.can_advance_line == true and thispartisdone == false:   
		Global.larryAppear = 2
		$LarryOut.start()
		Dialoguemanager.is_dialogue_active = false
		thispartisdone = true


# Day and night cycle transitions here
	if Global.timeOfDay == "Night" :
		if $sun.energy <= .75:
			$sun.energy += .0025

	if Global.timeOfDay == "Day" and  $sun.energy > 0:
		$sun.energy -= .0025

#Day and night TImers defined here
#look in scene tree under "sun" node to change the time for day and night cycles
func _on_day_timeout() -> void:
	print("Day over")
	$sun/Night.start()
	Global.timeOfDay = "Night"

func _on_night_timeout() -> void:
	print("Nights over")
	$sun/Day.start()
	Global.timeOfDay = "Day"
	
func _on_larry_out_timeout() -> void:
	Global.cutscene = 1
	Global.larryAnimationFinished = 0
	Dialoguemanager.text_box.queue_free()
	Dialoguemanager.current_line_index = 0
	get_tree().change_scene_to_packed(mainScene)


func _on_lamprey_intro_finished() -> void:
	$LampreyIntro.play()
