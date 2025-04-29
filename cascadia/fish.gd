extends Node2D

var PlayerEntered : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and PlayerEntered == true :
		queue_free()
		print("should be delteds")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "OrderArea" or area.name == "Area2D":
		z_index = -1


func _on_fish_area_area_exited(area: Area2D) -> void:
	if area.name == "SwimArea" :
		PlayerEntered = false
		print("Player Exited")


func _on_fish_area_area_entered(area: Area2D) -> void:
	if area.name == "SwimArea" :
		PlayerEntered = true
		print("Player entered")
