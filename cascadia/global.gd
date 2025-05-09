extends Node

#Player variables
var PlayerX : float = 0
var PlayerY : float = 0
var PlayerPos : Vector2 = Vector2(0,0)
var swimming : bool = false 
var timeOfDay : String = "Day"
var Dead : bool = false #Does not mean actually dead just drowining
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
var BoatInputStop : int = 15
  
#Scene switching                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
var SceneJustIn : String = "Main"
var cutscene : int = 0

#Larry
var larryAppear = 1
var larryAnimationFinished : int = 0
var textPos : Vector2 = Vector2( 0, 0)
var tutorial : bool = false
var LighthouseCutsceneDone = false
var foodCutscene : bool = false
var foodCutsceneCalled : bool = false
var Tutorialtriggeronce : bool = false
var triggeronceRock : bool = false
var RockLarrySceneDone = false
var StartRockLarryScene = false
#barrys rocks
var TalkingToBarry = false
var AtGreenRock = false
var GreenRockSceneFinished = false
var GreenRockPos : Vector2 = Vector2(0,0)
var triggeronceFish : bool = false

#Telescope variables
var PlayerEnteredTelescope = false
var deleteText = true
var partNumb : int = 0 #Interger that will repersent what number of part the player needs to get for telescope
#Change above variable when the player needs to find a certain piece, 
#For example if the player gets to the lighthouse and presses interact on the telescope
# then it changes partNumb to 1 and the lighthouse will automatically look at the part1pos Vector
var part1Pos : Vector2 = Vector2(-793.0, -766.0)
var part2Pos : Vector2 = Vector2(-793.0, -766.0)
var part3Pos : Vector2 = Vector2(24, -24)
#Change these variables when the player actually gets the parts
var part1Obtained = false
var part2Obtained = false
var part3Obtained = false
# Called when the node enters the scene tree for the first time.

#Textbox stuff
var letter_index = 0
var letter_time = .05
var space_time = .03
var punctuation_time = .1
var DontSpacebar = false
var optionsgiven = false

# sloppy collison
var last_key_pressed: String = ""
var NoLeft = false
var NoRight = false
var NoUp = false
var NoDown = false
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if SceneJustIn == "Lighthouse" and boatDirection == 0 :
		NewBoatPos = Vector2(320.0, 641.0)
	elif SceneJustIn == "Main" :
		NewBoatPos = boatPos
	for keycode in range(KEY_A, KEY_Z + 1):  # Or any range you want
		if Input.is_key_pressed(keycode):
			last_key_pressed = OS.get_keycode_string(keycode)
			break
