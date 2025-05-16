extends Node2D

var playerEntered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerEntered == true :
		if Input.is_action_just_pressed("interact"):
			queue_free()
			Global.YOUATETHESQUID = true

func _on_squibert_area_area_entered(area: Area2D) -> void:
	if area.name == "SwimArea" :
		playerEntered = true

func _on_squibert_area_area_exited(area: Area2D) -> void:
	if area.name == "SwimArea" :
		playerEntered = false
