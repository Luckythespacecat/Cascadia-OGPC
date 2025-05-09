extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 200

var text = ""
var letter_index = 0

var letter_time = Global.letter_time
var space_time = Global.space_time
var punctuation_time = Global.punctuation_time

signal finished_displaying2()

func _ready():
	timer.timeout.connect(_on_letter_display_timeout)
	timer.one_shot = true
	position = Global.textPos

func display_text(text_to_display: String):
	text = text_to_display
	letter_index = 0
	label.text = text_to_display
	await get_tree().process_frame
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await get_tree().process_frame
		await get_tree().process_frame
		custom_minimum_size.y = size.y
		
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	
	label.text = ""
	_display_letter()
	
func _display_letter():
	if letter_index < text.length():
		label.text += text[letter_index]
		letter_index += 1
	if letter_index >= text.length():
		finished_displaying2.emit()
		return
	match text[letter_index]:
		"!", "?", ".", ",":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)

func _on_letter_display_timeout():
	_display_letter()
