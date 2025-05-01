extends Node

#Player variables
var PlayerX : float = 0
var PlayerY : float = 0
var PlayerPos : Vector2 = Vector2(0,0)
var swimming : bool = false 
var timeOfDay : String = "Day"
var Dead : bool = false #DOes not mean actually dead just drowining
var FirstDrown : bool = true
var Hunger : int = 250

#boat variables
var wind : float = 1 
var onBoat : bool = false
var boatDirection : int = 0 
var boatPos : Vector2 = Vector2(0,0)
var NewBoatPos : Vector2 = Vector2(0, 60)
var AdjustSail : bool = false
var SailMovedE : bool= false     
var SailMovedQ : bool= false  
var damage : int = 0
  
#Scene switching                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
var SceneJustIn : String = "Main"
var cutscene : int = 0

#Larry
var larryAppear = 1
var larryAnimationFinished : int = 0
var textPos : Vector2 = Vector2( 0, 0)
var tutorial : bool = false
var LighthouseCutsceneDone : bool = false
var foodCutscene : bool = false
var foodCutsceneCalled : bool = false

#Telescope variable
var partNumb : int = 0 #Interger that will repersent what number of part the player needs to get for telescope

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if SceneJustIn == "Lighthouse" and boatDirection == 0 :
		NewBoatPos = Vector2(320.0, 641.0)
	elif SceneJustIn == "Main" :
		NewBoatPos = boatPos
		
