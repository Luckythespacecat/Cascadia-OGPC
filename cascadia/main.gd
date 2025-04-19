extends Node2D

var botY = 0
var topY = 0
var botX = 0
var topX = 0

const woodResource = preload("res://wood.tscn")
var woodInstance = woodResource.instantiate()

func wood():
	
	var woodInstance = woodResource.instantiate()
	woodInstance.position.y = 0
	woodInstance.position.x = 0

func spawnWwood():
	var botY = $CanvasLayer/UserInterface/bottomRight.global_position.y
	var topY = $CanvasLayer/UserInterface/topLeft.global_position.y
	var botX = $CanvasLayer/UserInterface/bottomRight.global_position.x
	var topX = $CanvasLayer/UserInterface/topLeft.global_position.x
	wood()

func _ready() -> void:
	woodInstance.position.y = 0
	woodInstance.position.x = 0

func _process(delta: float) -> void:
	pass


func _on_wood_timer_timeout() -> void:
	pass
