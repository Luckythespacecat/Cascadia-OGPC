extends Node2D

var next_scene = preload("res://lighthouse_room.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.timeOfDay == "Night" :
		$PointLight2D2.rotate(delta)
		if $PointLight2D2.energy <= .5:
			$PointLight2D2.energy += .001
	if Global.timeOfDay == "Day" :
		if $PointLight2D2.energy > 0:
			$PointLight2D2.energy -= .0025
	
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right") :
		pass
		#$AnimatedSprite2D.

func _on_door_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" :
		get_tree().change_scene_to_packed(next_scene)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "HeadArea" :
		Global.swimming = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" :
		Global.swimming = true
