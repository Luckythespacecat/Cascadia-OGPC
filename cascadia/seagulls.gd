extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = lerp(position, Vector2(-1049.0, -114.0), delta / 4)

	if position == Vector2(-1049.0, -114.0) :
		queue_free()
