extends Node2D

var deathOption : String = ""
var toggle = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if toggle == false:
		Dialoguemanager.start_dialogue(Vector2(400,518), [
	"  Um, your forgot to eat  ",
	"  oh well!  ",
	"  your eternal damnation is reliving the worst day of your life  ",
	"  Have fun!!!!!!!  " ])
		toggle = true
	if Dialoguemanager.is_dialogue_active == true:
		Dialoguemanager.text_box.scale = Vector2(4,4)
