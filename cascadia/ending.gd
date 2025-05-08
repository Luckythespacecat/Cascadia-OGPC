extends Node2D

var move : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move == 1:
		$Camera2D.position = lerp($Camera2D.position, Vector2(0,0), delta /4)
	elif move == 2:
		$CanvasLayer/Rope.position = lerp($Camera2D/Rope.position, Vector2($Camera2D/Rope.position.x, 100), delta /4)
		


func _on_fly_in_timeout() -> void:
	if move == 1:
		move = 2
