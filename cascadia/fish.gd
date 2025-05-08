extends Node2D

var PlayerEntered : bool = false
var foodcustsceneCalled
var allowInput : bool = false
var checkForFoodScene = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and PlayerEntered == true:
		queue_free()
		Global.foodCutscene = false
		#if Global.larryAppear == 1 :
		#	Global.larryAppear = 2
		#	Dialoguemanager.text_box.queue_free()
	if Global.foodCutscene == false and Global.triggeronceFish == true :
		$CutsceneInterval.start()

func _on_fish_area_area_exited(area: Area2D) -> void:
	if area.name == "SwimArea" :
		PlayerEntered = false

func _on_fish_area_area_entered(area: Area2D) -> void:
	if area.name == "BodyArea" or area.name == "SwimArea" or area.name == "HeadArea" or area.name == "FootArea":
		checkForFoodScene = true
	elif area.name == "LighthouseLightArea" or area.name == "LarryArea" :
		pass
	else:
		queue_free()
	if area.name == "SwimArea" :
		PlayerEntered = true
	if area.name == "SwimArea" and Global.tutorial == true and Global.foodCutscene == false and Global.foodCutsceneCalled == false and Global.onBoat == false:
		Global.foodCutscene = true
		Global.foodCutsceneCalled = true

func _on_cutscene_interval_timeout() -> void:
	allowInput = true
	Global.foodCutscene = false

func CutsceneOver():
	allowInput = true
	Global.foodCutscene = false
