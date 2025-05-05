extends Node2D

var onBack = false
var dialogueFinished = false
var ongreenrock = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Talk")
	Global.letter_time = 0.03
	Global.space_time = 0.02
	Global.punctuation_time = 0.01

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.AtGreenRock == true:
		global_position = Global.GreenRockPos 
	
	if Global.AtGreenRock == true and Global.GreenRockSceneFinished == false and ongreenrock == false:
		Dialoguemanager.start_dialogue( Vector2(global_position.x, global_position.y + 100), [
	"  Oh wow, thanks  !  ",
	"  The 'Journey' was much shorter than I expected  ",
	"  But a deals a deal  !  ",
	"  As promised, heres your radio part  ",
	"  Tell all your friends to shop at Barry's Rocks  !  ",
	"  Unless they all died from the tsunami  ...  ",
	"  That would sure suck  ...  ",
	"  Well I suppose this is goodbye  !  ",
	"  GOODBYE!!  "
		])
		visible = true
		ongreenrock = true
	if ongreenrock == true and Global.AtGreenRock == true :
		Global.part1Obtained = true
		
	if Dialoguemanager.can_advance_line == true :
		$AnimatedSprite2D.play("Idle")
	else :
		$AnimatedSprite2D.play("Talk")
	
	if Global.TalkingToBarry == true :
		Global.boatDirection = 0
	
	if onBack == false  and Global.TalkingToBarry == true :
		
		Dialoguemanager.start_dialogue( Vector2(global_position.x, global_position.y + 100), [
	"  Barry's Rocks! Get your Rocks from Barry  ",
	"  Fresh from the Tsunami!  ",
	"  10 year warranty guranteed for Barry's Rocks  ",
	"  Hey you, want some rocks?  ",
	"  I can cut you a great deal  ",
	"  Looking for a radio part  ?  ",
	"  Well, dont I have the deal for you  !  ",
	"  Right now, ive got an exclusive deal...  ",
	"  Buy a rock, get a radio part free  !  ",
	"  What do ya think???  ",
	"  I mean c'mon its a steal!  ",
	"  You're practically robbing me, in fact!  ",
	"  WAIT, YOU'RE ROBBING ME, AHHH!!!  ",
	"  So its a deal then, alright?  ",
	"  Wait, you dont got any plankton...  ",
	"  How 'bout this  ",
	"  Since you're such a nice gal...  ",
	"  I'll give you your rock radio part for free...  ",
	"  But you must take me to...  ",
	"  THE lEGENDARY GREEN ROCK!  ",
	"  It will be quite the journey...  ",
	"  You may not be ready for it...  ",
	"  They say barnacles who travel there never make it back...  ",
	"  Awesome, Ill just hop on your back here !  "
		])
		onBack = true
		
	if Dialoguemanager.is_dialogue_active == false and Global.TalkingToBarry == true and ongreenrock == false and Global.AtGreenRock == false:
		dialogueFinished = true 
		Global.TalkingToBarry = false
		visible = false
		print("ON back now")
		
	if Dialoguemanager.is_dialogue_active == false and Global.AtGreenRock == true and Global.GreenRockSceneFinished == false:
		dialogueFinished = true 
		Global.AtGreenRock = false
		Global.GreenRockSceneFinished = true
		visible = true
		Global.TalkingToBarry = false
		print("GOdybye bearryy")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "BodyArea" :
		Global.TalkingToBarry = true 


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "BodyArea" :
		#Global.TalkingToBarry = false
		pass
