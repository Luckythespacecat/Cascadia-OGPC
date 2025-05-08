extends Node2D

var next_scene = preload("res://lighthouse_room.tscn")
var target_position = Global.part1Pos
var direction = target_position - global_position
var boatAngle = 0
var addLater = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.swimming == false:
		pass
		#print("Player shouldnt be swimming rn")
	if Global.swimming == true:
		pass
		#print("Player should be swimming rn")
	
	for area in $Area2D.get_overlapping_areas() :
		if area.name == "HeadArea" :
			Global.swimming = false
	
	if Global.timeOfDay == "Night" :
		if Global.partNumb == 0:
			$PointLight2D.rotate(delta / 4)
		elif Global.partNumb == 1 :
			target_position = Global.part1Pos
			direction = target_position - global_position
			$PointLight2D.rotation = direction.angle()
		elif Global.partNumb == 2 :
			target_position = Global.part2Pos
			direction = target_position - global_position
			$PointLight2D.rotation = direction.angle()
		elif Global.partNumb == 3 :
			target_position = Global.part3Pos
			direction = target_position - global_position
			$PointLight2D.rotation = direction.angle()

		if $PointLight2D.energy <= .5:
			$PointLight2D.energy += .001
	if Global.timeOfDay == "Day" :
		if $PointLight2D.energy > 0:
			$PointLight2D.energy -= .0025
	for area in $Area2D.get_overlapping_areas() :
		if area.name == "FootArea" :
			Global.swimming = false
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right") :
		pass
		#$AnimatedSprite2D.

func _on_door_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" and Global.SceneJustIn == "Main" and z_index == 0:
		get_tree().change_scene_to_packed(next_scene)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" :
		Global.swimming = false
	if area.name == "BoatArea2D":
		boatAngle = Global.boatDirection
		Global.damage = Global.damage + 1
		Global.boatDirection += 4
		addLater = Global.boatDirection
		if Global.boatDirection > 8:
			Global.boatDirection = addLater - 8
		Global.BoatInputStop = boatAngle

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" :
		Global.swimming = true
		Global.onBoat = false
	if area.name == "BoatArea2D":
		Global.BoatInputStop = 15

func _on_door_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" and Global.SceneJustIn == "Lighthouse" :
		Global.SceneJustIn == "Main"

func _on_order_area_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 5

func _on_order_area_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 0
