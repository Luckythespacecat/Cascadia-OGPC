extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerPos = $CharacterBody2D.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playerPos = $CharacterBody2D.position
	position = lerp(position, playerPos, 5 * delta)
