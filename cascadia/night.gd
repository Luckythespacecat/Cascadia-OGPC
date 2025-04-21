extends DirectionalLight2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func night():
	if energy <= .75 :
		energy += .1

func day():
	if energy >= .75 :
		energy -= .0025

func _on_day_timeout() -> void:
	if Global.timeOfDay == false :
		Global.timeOfDay = true
		night()
	if Global.timeOfDay == true :
		Global.timeOfDay = false
		day()
