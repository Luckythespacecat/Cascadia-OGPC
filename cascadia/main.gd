extends Node2D

const woodResource = preload("res://wood.tscn")

func spawnWood():
	var playerX = Global.PlayerX
	var playerY = Global.PlayerY
	var spawnPosX = randi_range( playerX-2000,playerX+2000)
	var spawnPosY = randi_range( playerY-1000,playerY+1000)
	var woodInstance = woodResource.instantiate()
	add_child(woodInstance)
	woodInstance.position.y = spawnPosY
	woodInstance.position.x = spawnPosX
	print(str($Camera2D/Lighthouse_light.position) + "  " + str(Global.PlayerPos))
	# statement for print randomized coridanates
	#print(str(spawnPosX) + "  "+ str(spawnPosY))
	
func _ready() -> void:
	$Camera2D/Lighthouse_light.global_position = Global.PlayerPos
	
func _process(delta: float) -> void:
	var dir = $Boat/Player.global_position.direction_to($Boat.global_position)
	$CanvasLayer/UserInterface/Point.rotation = dir.angle()
	
	#var LightHousedir = $Boat/Player.global_position.direction_to($Lighthouse/PointLight2D2.global_position)
	#$CanvasLayer/UserInterface/LighthouseLightBody.rotation = LightHousedir.angle()
	if $Camera2D/Lighthouse_light.global_position.x > (Global.PlayerX - 892) and $Camera2D/Lighthouse_light.global_position.x < (Global.PlayerX  + 892):
		if $Lighthouse/PointLight2D2.global_position.x > $Camera2D/Lighthouse_light.global_position.x :
			$Camera2D/Lighthouse_light.global_position.x += 5
		if $Lighthouse/PointLight2D2.global_position.x < $Camera2D/Lighthouse_light.global_position.x :
			$Camera2D/Lighthouse_light.global_position.x -= 5
		
# Day and night cycle transitions here
	if Global.timeOfDay == "Night" :
		$Camera2D/Lighthouse_light.global_rotation = $Lighthouse/PointLight2D2.rotation
		if $sun.energy <= .75:
			$sun.energy += .0025
		
	if Global.timeOfDay == "Day" and  $sun.energy > 0:
		$sun.energy -= .0025


func _on_resource_timer_timeout() -> void:
	spawnWood()

#Day and night TImers defined here
#look in scene tree under "sun" node to change the time for day and night cycles
func _on_day_timeout() -> void:
	print("Day over")
	$sun/Night.start()
	Global.timeOfDay = "Night"

func _on_night_timeout() -> void:
	print("Nights over")
	$sun/Day.start()
	Global.timeOfDay = "Day"
