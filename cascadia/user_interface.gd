extends Node2D

var seagullScene = preload("res://seagulls.tscn")
var newPointRotation = 405.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeftArrow.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.part1Obtained and not Global.part1TriggerOnce:
		$ObtainedText.visible = true
		$ObtainedText.play("Part1")
		$ObtainedText/TextTimer.start()
		Global.part1TriggerOnce = true
	if Global.part2Obtained and not Global.part2TriggerOnce:
		$ObtainedText.visible = true
		$ObtainedText.play("Part2")
		$ObtainedText/TextTimer.start()
		Global.part2TriggerOnce = true
	if Global.part3Obtained and not Global.part3TriggerOnce:
		$ObtainedText.visible = true
		$ObtainedText.play("Part3")
		$ObtainedText/TextTimer.start()
		Global.part3TriggerOnce = true
	# Detects if the sail is set to a new direction and rotates the compass to indicate to player easier
	if Global.SailMovedE == true :
		newPointRotation += deg_to_rad($Point.rotation) - 45
		Global.SailMovedE = false
	if Global.SailMovedQ == true :
		newPointRotation += deg_to_rad($Point.rotation) + 45
		Global.SailMovedQ = false
	if $Point.rotation != newPointRotation :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(newPointRotation), 2 * delta)
	if $Point.rotation == newPointRotation :
		pass
	
func _on_area_2d_mouse_entered() -> void:
	$LeftArrow.frame = 1
	print("UM hover pretty pleassseee")


func _on_area_2d_mouse_exited() -> void:
	$LeftArrow.frame = 0
	print("UM stop hovering u brat")

func spawnSeagull():
	var seagullInstance = seagullScene.instantiate()
	add_child(seagullInstance)


func _on_seagull_spawn_timeout() -> void:
	if Global.timeOfDay == "Day" :
		spawnSeagull()
		
		


func _on_text_timer_timeout() -> void:
	$ObtainedText.visible = false
