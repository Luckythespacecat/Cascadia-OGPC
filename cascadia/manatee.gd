extends Node2D

var failure = false
var temp1 = false
var dialogue_step = 0
var waiting_for_choice = false
var choicetime = 0.0
var choiceready = false
var inputready = false
var time = false
var optionsgiven = false
var question1 = false
var question2 = false
var question3 = false
var triggerOnce1 = false
var NiceScale = 0 # Adds if player says right thing subtracts if they dont.
var Reset = false
var ResetTriggeronce = false

# Vector variables for the positions of text, change these to change positions
var wetherbySpeakingPos : Vector2 = Vector2(self.global_position.x -600 , self.global_position.y -400)
var Response1Pos : Vector2 = Vector2(self.global_position.x - 850, self.global_position.y - 100)
var Response2Pos : Vector2 = Vector2(self.global_position.x - 350, self.global_position.y - 100)

func _ready():
	dialogue_step = 0
	waiting_for_choice = false
	choiceready = false
	choicetime = 0.0
	inputready = false
	await get_tree().process_frame
	inputready = true
	time = false

func _process(delta: float) -> void:
	$Transition2.z_index += 1
	
	if Reset :
		$Transition2.scale = lerp($Transition2.scale, Vector2(1,1), delta)
		if not ResetTriggeronce :
			$Transition2/TryAgain.start()
			ResetTriggeronce = true
	
	$BodySprite.play()
	$HeadSprite.frame = $BodySprite.frame

	if not inputready:
		return 
	if choicetime > 0:
		choicetime -= delta
	else:
		choiceready = true
	manatee10()

func fail():
	if failure == true:
		pass

func manatee10():
	#Start
	if dialogue_step == 0 and Global.ManateeScene :
		Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  Most incredible, a human !  ",
			"  The name's Weatherby, my dear - ah, what is your name?  ",
			"  Meredith you say, what a nice name  ",
			"  So, what did you need?  "
		])
		dialogue_step = -1
	elif dialogue_step == -1 and not Dialoguemanager.is_dialogue_active:
		dialogue_step = 1
	#show choice q1
	elif dialogue_step == 1 : # and not waiting_for_choice:
		if Global.DontSpacebar == false:
			Dialoguemanager.start_dialogue(Response1Pos, [
		"  I'm looking for a radio component, have you seen one? (Press 'q')  ",
		])
			Dialoguemanager2.start_dialogue(Response2Pos, [
		"  Just to meet new people, find anything cool lately? (Press 'e')  ",
		])
			Global.DontSpacebar = true
			question1 = true
			choicetime = 0.1
			choiceready = false
			triggerOnce1 = false
		#determine choice q1
		if Input.is_action_just_pressed("Dialogue1"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale -= 1
			#asking question here
			Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  Perhaps . . .  ",
			"  Assuming I did have such an object,  ",
			"  why, I might hesitate to give it away . . .  "
			])

			dialogue_step = 2.5
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale += 1
			#asking question here
			Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  Oh my, I appreciate you speaking so politely,  ",
			"  but, yes, I did happen across what you are looking for.  ",
			"  Here, have a good look !  ",
			"  Quite rad, is it not ?  "
			])
			dialogue_step = 2.5
			waiting_for_choice = false
			choiceready = false
	elif dialogue_step == 2.5 and not Dialoguemanager.is_dialogue_active:
		dialogue_step = 2
	#q2 start
	elif dialogue_step == 2 : # and not waiting_for_choice:
		if Global.DontSpacebar == false:
			Dialoguemanager.start_dialogue(Response1Pos, [
		"  Can I have that, I really need that radio piece (Press 'q')  ",
		])
			Dialoguemanager2.start_dialogue(Response2Pos, [
		"   Oh nice, could I buy it off you?  (Press 'e')  ",
		])
			Global.DontSpacebar = true
			choicetime = 0.1
			choiceready = false
			triggerOnce1 = false
		#determine choice q1
		if Input.is_action_just_pressed("Dialogue1"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale -= 1
			#asking question here
			Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  Ah, I may have before, but you came at the wrong time . . . ",
			"  I just named it Clyde,  ", 
			"  it is my friend . . .  "
			])
			dialogue_step = 3.5
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale += 1
			Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  I would but I just adopted him  ",
			"  I call him Clyde  ",
			"  The Manatee oath states we can't give away named objects . . .   ",
			"  At least without verifying the new caregiver . . .  "
			])
			dialogue_step = 3.5
			waiting_for_choice = false
			choiceready = false
	elif dialogue_step == 3.5 and not Dialoguemanager.is_dialogue_active:
		dialogue_step = 3
	elif dialogue_step == 3 : # and not waiting_for_choice:
		if Global.DontSpacebar == false:
			Dialoguemanager.start_dialogue(Response1Pos, [
		"  Could I adopt Clyde? (Press 'q')  ",
		])
			Dialoguemanager2.start_dialogue(Response2Pos, [
		"  I'll adopt him on one condition, his name will forever remain as Clyde (Press 'e')  ",
		])
			Global.DontSpacebar = true
			choicetime = 0.1
			choiceready = false
			triggerOnce1 = false
		#determine choice q1
		if Input.is_action_just_pressed("Dialogue1"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale += 1
			#asking question here
			if  NiceScale > 0 :
				Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  Why, by all means, that might work !  ",
			"  Please, allow Clyde to always have a good home . . .  ",
			"  Here you are, farewell !  "
			])
				givePart()
			else :
				Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			" I could not trust one such as you . . .  "
				])
				Reset = true
			dialogue_step = 4.5
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			Global.DontSpacebar = false
			Global.optionsgiven = false
			Dialoguemanager2.text_box.visible = false
			NiceScale -= 1
			
			if  NiceScale > 0 :
				Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			"  That might work, actually !  ",
			"  Just make sure the name never changes.  ",
			"  Farewell !  "
			])
				givePart()
			else :
				Dialoguemanager.start_dialogue(wetherbySpeakingPos, [
			" I could not trust one such as you . . . "
			])
				Reset = true
				
			
			dialogue_step = 4.5
			waiting_for_choice = false
			choiceready = false
func givePart():
	Global.part3Obtained = true
	Global.ManateeScene = false


func ResetScene():
	pass


func _on_try_again_timeout() -> void:
	$Transition2.play("Out")
	$Transition2/Timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
