extends Node2D

func _ready():
	$Body.play()
	Global.textPos = position

func _process(delta):

	Dialoguemanager.start_dialogue( Global.textPos, [
	"  Hey you, its about time you woke up  ",
		"  The names Larry  ",
		"  Larry the lamprey that is  ",
		"  You're one of the only survivors  ",
		"  From what?  ",
		"  You must've got hit hard  ",
		"  I guess i'll help you around  ",
		"  Even though i'm most likely...  ",
		"  a figment of your imagination  "
	])
	
	if Dialoguemanager.current_line_index == 8 and Dialoguemanager.can_advance_line == true:
		Global.custcene = 1

	if Dialoguemanager.can_advance_line == true :
		$Head.play("Idle")
	else :
		$Head.play("Talk")
