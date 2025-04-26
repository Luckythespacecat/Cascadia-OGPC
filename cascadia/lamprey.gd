extends Node2D

func _ready():
	$Body.play()
	Global.textPos = position

func _process(delta):

	Dialoguemanager.start_dialogue( Global.textPos, [
	"  Hey you, its about time you woke up  ",
		"  The names Larry  ",
		"  Larry the lamprey that is  ",
		"  Anyhow what a good day  "
	])
	
	if Dialoguemanager.can_advance_line == true :
		$Head.play("Idle")
	else :
		$Head.play("Talk")
