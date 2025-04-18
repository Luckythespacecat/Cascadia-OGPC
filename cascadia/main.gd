extends Node2D

func wood():
	const woodResource = preload("res://wood.tscn")
	get_tree().add_child(woodResource)
	
	var thing = Timer.new()
	thing.wait_time = 3
	thing.autostart

func spawnWood():
	var botY = $CanvasLayer/UserInterface/bottomRight.global_position.y
	var topY = $CanvasLayer/UserInterface/topLeft.global_position.y
	var botX = $CanvasLayer/UserInterface/bottomRight.global_position.x
	var topX = $CanvasLayer/UserInterface/topLeft.global_position.x
	
	#if thing.timeout == true :
		#wood()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
