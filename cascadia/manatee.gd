extends Node2D

var failure = false
var temp1 = false
var dialogue_step = 0
var waiting_for_choice = false
var choicetime = 0.0
var choiceready = false
var inputready = false
var time = false

func _ready():
	dialogue_step = 0
	waiting_for_choice = false
	choiceready = false
	choicetime = 0.0
	inputready = false
	await get_tree().process_frame
	inputready = true

func _process(delta: float) -> void:
	
	$BodySprite.play()
	$HeadSprite.frame = $BodySprite.frame

	if not inputready:
		return 
	if choicetime > 0:
		choicetime -= delta
	else:
		choiceready = true
	while Dialoguemanager.is_dialogue_active == true:
		time == true
	manatee10()

func choice():
	if Input.is_action_just_pressed("Dialogue1"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
			"  Look, it worked !  "
		])
	if Input.is_action_just_pressed("Dialogue2"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
			"  Hey, this worked2  ! "
		])

func fail():
	if failure == true:
		get_node("Manatee").queue_free()

func manatee10():
	if dialogue_step == 0:
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
			"  Look, it worked!  ",
			"  This is what Clyde will say to initiate our dialogue tree.  ",
		])
		if time == true:
			dialogue_step = 1
	elif dialogue_step == 1 and not waiting_for_choice:
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
	elif dialogue_step == 2 and Input.is_action_just_pressed("advance_dialogue"):
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
			"  This is what Clyde will say before giving the part.  ",
		])
		givePart()
		dialogue_step = 0
func givePart():
	pass

func show_choice_options():
	Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 200, Global.textPos.y + 200), [
		"  Option 1: Dialogue1 (Press 'z')",
		"  Option 2: Dialogue2 (Press 'x')"
	])

func show_correct_response():
	Dialoguemanager.start_dialogue(Vector2(Global.textPos.x+ 200, Global.textPos.y + 200), [
		"  Correct choice to obtain part.  "
	])

func show_incorrect_response():
	Dialoguemanager.start_dialogue(Vector2(Global.textPos.x + 100, Global.textPos.y + 200), [
		"  Incorrect choice to obtain part.  "
	])
