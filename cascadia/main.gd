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

func _on_resource_timer_timeout() -> void:
	spawnWood()
