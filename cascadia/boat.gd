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

#Soon to be player death - not working
func PlayerExited(): 
	Global.PlayerX == 0
	Global.PlayerY == 0
	

#Player death continued
func _on_area_2d_area_exited(area: Area2D) -> void:
	PlayerExited()

#Generate random number for rowing speed - disabled for now
func randomgen(): 
	rand = randi_range(0, 1)
	
func sailMovement():
	if Global.boatDirection == "Left" :
		pass
