extends Node2D

@onready var botY = $CanvasLayer/UserInterface/bottomRight.global_position.y
@onready var topY = $CanvasLayer/UserInterface/topLeft.global_position.y
@onready var botX =  $CanvasLayer/UserInterface/bottomRight.global_position.x
@onready var topX = $CanvasLayer/UserInterface/topLeft.global_position.x

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
	print(str(spawnPosX) + "  "+ str(spawnPosY))
	
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var dir = $Boat/Player.global_position.direction_to($Boat.global_position)
	$CanvasLayer/UserInterface/Point.rotation = dir.angle()
	
# Day and night cycle transitions here
	if Global.timeOfDay == "Night" and  $sun.energy <= .75:
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
