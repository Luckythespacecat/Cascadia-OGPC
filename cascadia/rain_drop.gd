extends Node2D

var randSpeed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale.x = randf_range(.5,1.5)
	scale.y = randf_range(.5,1.5)
	randSpeed = randi_range(8,25)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += randSpeed
	position.y += randSpeed
	
	if Global.timeOfDay == "Night":
		$DaySprite.visible = false
		$NightSprite.visible = true
	if Global.timeOfDay == "Day":
		$DaySprite.visible = true
		$NightSprite.visible = false

func _on_rain_timer_timeout() -> void:
	queue_free()
