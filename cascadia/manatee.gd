extends Node2D

var failure = false
var temp1 = false
func _process(delta: float) -> void:
	if temp1 == false:
		manatee10()

func choice():
	if Input.is_action_just_pressed("Dialogue1"):
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
		"  Look, it worked !  "
		])
	if Input.is_action_just_pressed("Dialogue2"):
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
		"  Hey, this worked2  ! "
		])

func fail():
	if failure == true:
		manatee10().queue_free()

func manatee10():
	var temp1 = false
	#if statement here to see if player is next to Clyde or whatnot - ensure this is the proper time for the dialogue
	if Input.is_action_just_pressed("advance_dialogue"):
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
		"  Look, it worked !  ",
		"  This is what Clyde will say to initiate our dialogue tree  ",
		])
		if Input.is_action_just_pressed("advance_dialogue"):
			Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX - 100, Global.textPos.y + Global.PlayerY), [
				"  Incorrect choice to obtain part  "
			])
			Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX + 100, Global.textPos.y + Global.PlayerY), [
				"  Correct choice to obtain part  "
			])
			if Input.is_action_just_pressed("Dialogue1"):
				Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX - 100, Global.textPos.y + Global.PlayerY), [
					"  Incorrect choice to obtain part  "
				])
				failure = true
				if Input.is_action_just_pressed("Dialogue2"):
					Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX, Global.textPos.y + Global.PlayerY), [
					"  Correct choice to obtain part  "
					])
					Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
					"  Look, it worked !  ",
					"  This is what Clyde will say next  ",
					])
					if Input.is_action_just_pressed("advance_dialogue"):
						Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX - 100, Global.textPos.y + Global.PlayerY), [
						"  Incorrect choice to obtain part  "
						])
						Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX + 100, Global.textPos.y + Global.PlayerY), [
						"  Correct choice to obtain part  "
						])
						if Input.is_action_just_pressed("Dialogue1"):
							Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX - 100, Global.textPos.y + Global.PlayerY), [
							"  Incorrect choice to obtain part  "
							])
							failure = true
						if Input.is_action_just_pressed("Dialogue2"):
							Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + Global.PlayerX, Global.textPos.y + Global.PlayerY), [
							"  Correct choice to obtain part  "
							])
							Dialoguemanager.start_dialogue( Vector2(Global.textPos.x + 100, Global.textPos.y + 100), [
							"  Look, it worked !  ",
							"  This is what Clyde will say before giving the part  ",
							])
							givePart()
	temp1 = true
func givePart():
	pass
	#animation for giving part/whatever happens after part is given.
