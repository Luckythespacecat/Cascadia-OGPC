extends Node2D
const rainResource = preload("res://rain_drop.tscn")
var randx = 0
var randy = 0
var randVector : Vector2 = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	randomPos()

func randomPos():
	randy = randi_range(1000, -1000.0)
	randVector = Vector2(randx, randy)

func spawnRain():
	var rainInstance = rainResource.instantiate()
	add_child(rainInstance)
	rainInstance.position = randVector


func _on_spawn_timer_timeout() -> void:
	spawnRain()
