extends Node2D

const woodResource = preload("res://wood.tscn")


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
	elif itemToSpawn >= 10 and itemToSpawn < 40 :
		pass
	# statement for print randomized coridanates
	
func _ready() -> void:
	Global.custcene = 1

func ReSetupScene() :
	Global.boatDirection = 0
	Global.PlayerY += 10
	Global.swimming = false
	$SceneReset.start()
	print("Timer started")

func _process(delta: float) -> void:

	
	#var dir = $Boat/Player.global_position.direction_to($Boat.global_position)
	#$CanvasLayer/UserInterface/Point.rotation = dir.angle()
	#scene transition setup
	if Global.SceneJustIn == "Main" :
		pass
	elif  Global.SceneJustIn == "Lighthouse" :
		get_tree().reload_current_scene()
		ReSetupScene()
		Global.SceneJustIn = "Main"

	if Global.Dead == true:
		Global.PlayerPos = $Boat.position
		Global.PlayerX = Global.PlayerPos.x
		Global.PlayerY = Global.PlayerPos.y
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
	print("Day over")
	$TheGreatOcean.play()
	$ANewFuture.stop()
	$sun/Night.start()
	Global.timeOfDay = "Night"

func _on_night_timeout() -> void:
	$TheGreatOcean.stop()
	$ANewFuture.play()
	print("Nights over")
	$sun/Day.start()
	Global.timeOfDay = "Day"
