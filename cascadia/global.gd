extends Node

var PlayerX = 0
var PlayerY = 0
var PlayerPos : Vector2 = Vector2(0,0)
var onBoat = false
var wind = 0
var boatDirection := 0 
var swimming = false 
var boatPos : Vector2 = Vector2(0,0)
var timeOfDay = "Day"
var Dead = false
var AdjustSail = false                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
var SceneJustIn = "Main"
var NewBoatPos : Vector2 = Vector2(0, 60)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if SceneJustIn == "Lighthouse" and boatDirection == 0 :
		NewBoatPos = Vector2(320.0, 641.0)
	elif SceneJustIn == "Main" :
		NewBoatPos = boatPos
