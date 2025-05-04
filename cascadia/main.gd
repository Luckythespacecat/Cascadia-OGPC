extends Node2D

const woodResource = preload("res://wood.tscn")
const BarryResource = preload("res://rock_area.tscn")
const radioParts = preload("res://parts.tscn") # load the parts scene for radio repair
const fish = preload("res://fish.tscn")

var drownLarryScene = false
var texboxRemove = false
var wood_instances = {}
var tempFishscene = false
var saveIndex = 0
var LighthouseCalled = false
var triggeronce = false
var triggeronceDrown = false
var triggeronceFish = false
var triggeronceLighthouse = false

func setupBarry():
	var BarryInstance = BarryResource.instantiate()
	add_child(BarryInstance)
	BarryInstance.position = Vector2(-793.0, -766.0)
	BarryInstance.scale = Vector2(1, 1)
func spawnItems(): #Spawning squence, I will use as template to make more spawn functions
	var playerX = Global.PlayerX
	var playerY = Global.PlayerY
	var spawnPosX = randi_range( playerX-2000,playerX+2000)
	var spawnPosY = randi_range( playerY-1000,playerY+1000)
	var itemToSpawn = randi_range(1,100)
	if itemToSpawn >= 1 and itemToSpawn < 10 :
		var woodInstance = woodResource.instantiate()
		add_child(woodInstance)
		woodInstance.position.y = spawnPosY
		woodInstance.position.x = spawnPosX
		
		wood_instances[woodInstance] = woodInstance
		woodInstance.connect("input_event", Callable(self, "_on_wood_interacted"))
		
	elif itemToSpawn >= 10 and itemToSpawn < 15 :
		var fishInstance = fish.instantiate() 
		add_child(fishInstance)
		fishInstance.position.y = spawnPosY
		fishInstance.position.x = spawnPosX
		
	# statement for print randomized coridanates
	
func _on_wood_interacted(viewport, event, shape_idx):
	if Input.is_action_pressed("interact"):
		for woodInstance in wood_instances.keys():
			if woodInstance:
				woodInstance.queue_free()
				wood_instances.erase(woodInstance)
				break
	
func _ready() -> void:
	Global.DontSpacebar == false
	Global.wind = 3
	if Global.SceneJustIn != "Lighthouse":
		Global.cutscene = 1
		Global.larryAppear = 1
	if Global.partNumb == 1 :
		setupBarry()

func ReSetupScene() :
	Global.boatDirection = 0
	Global.PlayerY += 10
	Global.swimming = false
	$SceneReset.start()
	print("Timer started")

func _process(delta: float) -> void:
	
	if LighthouseCalled == true and Global.LighthouseCutsceneDone == false:
		LighthouseLarry()

	if Global.foodCutscene == true:
		FishLarryCutscene()
		$Boat/Player/drownTimer.stop()
		if tempFishscene == false :
			Global.larryAppear = 1
			tempFishscene = true
	
	if Global.tutorial == false :
		TutorialLarry()
		LighthouseCalled = true
	

	if Global.SceneJustIn == "Main" :
		pass
	elif  Global.SceneJustIn == "Lighthouse" :
		get_tree().reload_current_scene()
		ReSetupScene()
		Global.SceneJustIn = "Main"

	if Global.Dead == true:
		if Global.FirstDrown == true :
			if drownLarryScene == false :
				saveIndex = $Boat/Player.z_index
				Global.larryAppear = 1
				drownLarryScene = true
				$Lamprey.global_position.x = $Boat/Player.global_position.x + 30
				$Lamprey.global_position.y = $Boat/Player.global_position.y 
			DrownLarry()
		else :
			Global.Hunger -= 50
			Global.PlayerPos = $Boat.position
			Global.PlayerX = Global.PlayerPos.x
			Global.PlayerY = Global.PlayerPos.y
			$Boat/Player/AnimatedSprite2D.play("Idle")
			Global.Dead = false
		
	$CanvasLayer/Lighthouse_light.global_rotation = $Lighthouse/PointLight2D.rotation

# Day and night cycle transitions here
	if Global.timeOfDay == "Night" :
		if $sun.energy <= .75:
			$sun.energy += .0025

	if Global.timeOfDay == "Day" and  $sun.energy > 0:
		$sun.energy -= .0025

func _on_resource_timer_timeout() -> void:
	spawnItems()

#Day and night TImers defined here
#look in scene tree under "sun" node to change the time for day and night cycles
func _on_day_timeout() -> void:
	$ANewFuture.stop()
	print("Day over")
	$TheGreatOcean.play() #Night Music
	$sun/Night.start()
	Global.timeOfDay = "Night"
	Global.wind = randf_range(3, 4)

func _on_night_timeout() -> void:
	$TheGreatOcean.stop()
	$ANewFuture.play() #Day Music
	print("Nights over")
	$sun/Day.start()
	Global.timeOfDay = "Day"
	Global.wind = randf_range(2, 3)

func DrownLarry() :
	$Boat/Player.z_index = $Lamprey.z_index - 1
	Global.textPos = $Lamprey.position
	$Boat/Player/AnimatedSprite2D.pause()
	if triggeronceDrown == false :
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x - 55, Global.textPos.y - 50), [
		"  WOOAAH ! ! !  ",
		"  Watch it, you almost drowned!  ",
		"  If you drown I might not be able to save you!  ",
		"  And then you might get sick or something  " ])
		triggeronceDrown = true
	if Dialoguemanager.can_advance_line == true and Dialoguemanager.current_line_index == 3 and Global.TalkingToBarry == false and Global.AtGreenRock == false:
		Global.FirstDrown = false
		Dialoguemanager.is_dialogue_active = false
		$Lamprey/EndDialogue.start()
		Global.larryAppear = 2
		Global.PlayerPos = $Boat.position
		Global.PlayerX = Global.PlayerPos.x
		Global.PlayerY = Global.PlayerPos.y
		$Boat/Player/AnimatedSprite2D.play("Idle")
		Global.Dead = false
		texboxRemove = true
		$Boat/Player.z_index = saveIndex
		
func TutorialLarry() :
	if triggeronce == false :
		Dialoguemanager.start_dialogue( Vector2(Global.textPos.x - 55, Global.textPos.y - 50), [
		"  Hey over here!  ",
		"  That is a very convienent raft you got there!  ",
		"  Press 'E' and 'Q' to rotate the sail  " ])
		triggeronce = true
	if Dialoguemanager.can_advance_line == true and Dialoguemanager.current_line_index == 2 and Global.TalkingToBarry == false and Global.AtGreenRock == false:
		Global.tutorial = true
		Dialoguemanager.is_dialogue_active = false
		$Lamprey/EndDialogue.start()
		Global.larryAppear = 2
		texboxRemove = true

func _on_lighthouse_light_area_area_entered(area: Area2D) -> void:
	if area.name == "BodyArea" and Global.timeOfDay == "Night" and Global.onBoat == true and Global.LighthouseCutsceneDone == false and Global.AtGreenRock == false:
		Global.boatDirection = 0
		Global.larryAppear = 1
		$Lamprey.global_position.x = $Boat/Player.global_position.x + 150
		$Lamprey.global_position.y = $Boat/Player.global_position.y
		Global.textPos = $Lamprey.position
		if triggeronceLighthouse == false :
			Dialoguemanager.start_dialogue( Vector2(Global.textPos.x - 55, Global.textPos.y - 50), [
	"  Did you see that?  ",
	"  That must be coming from a lighthouse!  ",
	"  Follow the light and see where it leads!  ",
	"  Maybe there, we can call for help!  "
				])
			triggeronceLighthouse = true
			LighthouseCalled = true

func FishLarryCutscene():
	
	print("Custcene should be workig")
	$Lamprey.global_position.x = $Boat/Player.global_position.x + 150
	$Lamprey.global_position.y = $Boat/Player.global_position.y
	Global.textPos = $Lamprey.position
	if triggeronceFish == false :
		Dialoguemanager.start_dialogue(Vector2(Global.textPos.x - 55, Global.textPos.y - 50), [
		"  Well looky here, its a fish ",
		"  you can eat it if your hungry  ",
		"  press 'E' to dive down and eat that fish  " ])
		triggeronceFish = true
		if Dialoguemanager.can_advance_line == true and Dialoguemanager.current_line_index == 2 and Global.TalkingToBarry == false and Global.AtGreenRock == false:
			Dialoguemanager.is_dialogue_active = false
			$Lamprey/EndDialogue.start()
			Global.larryAppear = 2
			texboxRemove = true
			$Boat/Player/drownTimer.start()
			Global.foodCutscene =  false

func _on_end_dialogue_timeout() -> void:
	if texboxRemove == true:
		Dialoguemanager.text_box.queue_free()
		Dialoguemanager.current_line_index = 0
		texboxRemove = false

func LighthouseLarry():
	if Dialoguemanager.current_line_index == 3 and Dialoguemanager.can_advance_line == true and Global.TalkingToBarry == false and Global.AtGreenRock == false:   
		Global.LighthouseCutsceneDone == true
		Dialoguemanager.is_dialogue_active = false
		$Lamprey/EndDialogue.start()
		Global.larryAppear = 2
		texboxRemove = true
		Global.LighthouseCutsceneDone = true
