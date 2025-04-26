extends Node2D

func _ready():
	$Body.play()

func _process(delta):

	Dialoguemanager.start_dialogue(position, [
	"  Hey you, its about time you woke up  ",
		"  The names Larry  ",
		"  Larry the lamprey that is  ",
		"  Anyhow what a good day  "
	])
	
	if Dialoguemanager.is_dialogue_active == true :
		$Head.play("Talk")
	else :
		$Head.play("Idle")
