extends Node2D

func _ready():
	$Body.play()
	Global.textPos = position

func _process(delta):
	if Global.larryAppear == 3 :
		$Body.visible = false
		$Head.visible = false
	
	if Global.larryAppear == 2 :
		$Body.visible = false
		$Head.visible = false
		$WaterAnimition.visible = true
		$WaterAnimition.play("InWater")
		Global.larryAppear = 0

	if Global.larryAppear == 1 :
		$Body.visible = false
		$Head.visible = false
		$WaterAnimition.visible = true
		$WaterAnimition.play("OutWater")
		Global.larryAppear = 1.5


	if Dialoguemanager.can_advance_line == true :
		$Head.play("Idle")
	else :
		$Head.play("Talk")

func _on_water_animition_animation_finished() -> void:
	Global.larryAnimationFinished = 1
	$WaterAnimition.visible = false
	if Global.larryAppear == 1.5 :
		$Body.visible = true
		$Head.visible = true
		$Head.play()
		$Body.play()
		Global.larryAppear = 0
		Global.larryAnimationFinished = 0
