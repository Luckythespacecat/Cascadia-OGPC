extends Node2D

var PlayerEntered : bool = false
var foodcustsceneCalled
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and PlayerEntered == true :
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "OrderArea" or area.name == "Area2D":
		z_index = -1

func _on_fish_area_area_exited(area: Area2D) -> void:
	if area.name == "SwimArea" :
		PlayerEntered = false
	if area.name == "BodyArea" or area.name == "SwimArea" or area.name == "HeadArea" or area.name == "FootArea":
		pass
	else:
		queue_free()

func _on_fish_area_area_entered(area: Area2D) -> void:
	if area.name == "SwimArea" :
		PlayerEntered = true
	if area.name == "SwimArea" and Global.tutorial == true and Global.foodCutscene == false and Global.foodCutsceneCalled == false and Global.onBoat == false:
		Global.foodCutscene = true
		Global.foodCutsceneCalled = true
