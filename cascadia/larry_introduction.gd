extends Node2D

const mainScene = preload("res://main.tscn")

	
func _ready() -> void:
	pass

func ReSetupScene() :
	Global.boatDirection = 0
	Global.PlayerY += 10
	Global.swimming = false
	$SceneReset.start()
	print("Timer started")

func _process(delta: float) -> void:

	if  Global.custcene == 1 :
		get_tree().change_scene_to_packed(mainScene)

# Day and night cycle transitions here
	if Global.timeOfDay == "Night" :
		if $sun.energy <= .75:
			$sun.energy += .0025

	if Global.timeOfDay == "Day" and  $sun.energy > 0:
		$sun.energy -= .0025


#Day and night TImers defined here
#look in scene tree under "sun" node to change the time for day and night cycles
func _on_day_timeout() -> void:
	print("Day over")
	$sun/Night.start()
	Global.timeOfDay = "Night"

func _on_night_timeout() -> void:
	print("Nights over")
	$sun/Day.start()
	Global.timeOfDay = "Day"
