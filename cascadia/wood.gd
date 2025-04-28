extends Node2D

@onready var wood_sprite = $AnimatedSprite2D
var InWood = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if InWood == true:
		if Input.is_action_pressed("interact"):
			Global.damage -= 1
			print("Boat repaired")
			queue_free()
			InWood = false

func _on_wood_body_area_entered(area: Area2D) -> void:
	if area.name == "BodyArea" :
		InWood = true
