extends Node2D

var rand
#Timer for the 'rowing animation'
func _ready(): 
	$AnimatedSprite2D.play("default")
	$Sail.play("Front")
	$Timer.start()

#function to choose which rowing speed will occur
func _process(delta: float) -> void: 
	sailMovement()
	pass
	#BoatToPlayer()

#Rowing speed 2 - change the float value to change speed
#func BoatToPlayer2(): 
		#var tween = get_tree().create_tween()
		#tween.tween_property(self, "position", Global.PlayerPos, 0.60).set_trans(Tween.TRANS_LINEAR)

#Ensure boat follows player - does nothing
func BoatToPlayer(): 
	pass
	


#Generate random number for rowing speed - disabled for now
func randomgen(): 
	rand = randi_range(0, 1)

func sailMovement():
	if Global.boatDirection == "Left" :
		position.x -= .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX -= .25
			Global.PlayerY += .25
	if Global.boatDirection == "Right" :
		position.x += .25
		position.y += .25
		if Global.swimming == false:
			Global.PlayerX += .25
			Global.PlayerY += .25


func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.swimming = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	Global.swimming = true
