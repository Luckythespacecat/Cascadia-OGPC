extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.Hunger -= 1
	$Fill.size.x = int(lerp(int($Fill.size.x), int(Global.Hunger), delta ))
