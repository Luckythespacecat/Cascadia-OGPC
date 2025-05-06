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
	
	if Input.is_action_just_pressed("Dialogue1") or Input.is_action_just_pressed("Dialogue2") and Global.optionsgiven == true :
		Global.DontSpacebar = false
		Global.optionsgiven = false
		#Dialoguemanager2.text_box.queue_free()
		#Dialoguemanager.text_box.queue_free()
	
	$BodySprite.play()
	$HeadSprite.frame = $BodySprite.frame

	if not inputready:
		return 
	if choicetime > 0:
		choicetime -= delta
	else:
		choiceready = true
	manatee10()

func choice():
	if Input.is_action_just_pressed("Dialogue1"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 300), [
			"  Look, it worked !  "
		])
	if Input.is_action_just_pressed("Dialogue2"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
			"  Hey, this worked2  ! "
		])

func fail():
	if failure == true:
		pass

func manatee10():
	if dialogue_step == 0 and Input.is_action_just_pressed("advance_dialogue"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 300), [
			"  Well I'll be, look its a human  ",
			"  My names Wetherby, you are?  ",
			"  Meredith you say, what a nice name  ",
			"  So why are you talking to me?  "
		])
		dialogue_step = -1
	elif dialogue_step == -1 and not Dialoguemanager.is_dialogue_active:
		dialogue_step = 1
	elif dialogue_step == 1 and not waiting_for_choice:
		question1 = true
		show_choice_options()
		waiting_for_choice = true
		choicetime = 0.1
		choiceready = false
	elif dialogue_step == 1 and waiting_for_choice and choiceready:
		if Input.is_action_just_pressed("Dialogue1"):
			show_incorrect_response()
			failure = true
			dialogue_step = 0
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			show_correct_response()
			dialogue_step = 2
			waiting_for_choice = false
			choiceready = false
	elif dialogue_step == 1 and not waiting_for_choice:
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 300), [
			"  Weatherby second statement/question here  "
			])
		question2 = true
		show_choice_options()
		waiting_for_choice = true
		choicetime = 0.1
		choiceready = false
	elif dialogue_step == 2 and waiting_for_choice and choiceready:
		if Input.is_action_just_pressed("Dialogue1"):
			show_incorrect_response()
			failure = true
			dialogue_step = 0
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			show_correct_response()
			dialogue_step = 3
			waiting_for_choice = false
			choiceready = false
	elif dialogue_step == 1 and not waiting_for_choice:
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 300), [
			"  Weatherby third statement/question here  "
			])
		question3 = true
		show_choice_options()
		waiting_for_choice = true
		choicetime = 0.1
		choiceready = false
	elif dialogue_step == 3 and waiting_for_choice and choiceready:
		if Input.is_action_just_pressed("Dialogue1"):
			show_incorrect_response()
			failure = true
			dialogue_step = 0
			waiting_for_choice = false
			choiceready = false
		elif Input.is_action_just_pressed("Dialogue2"):
			show_correct_response()
			dialogue_step = 4
			waiting_for_choice = false
			choiceready = false
	elif dialogue_step == 4 and Input.is_action_just_pressed("advance_dialogue"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 300), [
			"  This is what Clyde will say before giving the part.  ",
		])
		givePart()
		dialogue_step = 0
func givePart():
	pass

func show_choice_options():
	if Global.DontSpacebar == false and question1 == true :
		Global.DontSpacebar = true
		Global.optionsgiven = true
		
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x - 100, Global.textPos.y + 300), [
		"  I'm looking for a redio compenent have you seen one? (Press 'q')  ",
		])
		Dialoguemanager2.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
		"  Just to meet new people, find anything cool lately? (Press 'e')  ",
		])
		question1 = false
	if Global.DontSpacebar == false and question2 == true :
		Global.DontSpacebar = true
		Global.optionsgiven = true
		
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x - 100, Global.textPos.y + 300), [
		"  2 Incorrect  ",
		])
		Dialoguemanager2.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
		"  2 Correct  ",
		])
		question2 = false
	if Global.DontSpacebar == false and question3 == true :
		Global.DontSpacebar = true
		Global.optionsgiven = true
		
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x - 100, Global.textPos.y + 300), [
		"  3 Incorrect  ",
		])
		Dialoguemanager2.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
		"  3 Correct  ",
		])
		question3 = false

func show_correct_response():
	Dialoguemanager.start_dialogue(Vector2(Global.textPos.x+ 200, Global.textPos.y + 300), [
		"  Weatherby 'correct choice' here  "
	])
	

func show_incorrect_response():
	Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 100, Global.textPos.y + 300), [
		"  Weatherby 'incorrect choice' here  "
	])
