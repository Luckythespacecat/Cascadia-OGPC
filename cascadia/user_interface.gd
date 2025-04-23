extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeftArrow.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#left down
	if Global.boatDirection == 1 :
		print("Its working atleast")
		$Point.rotation_degrees = lerp($Point.rotation_degrees, 90, 1 * delta)
	#leftup
	if Global.boatDirection == 7 :
		pass
	#rightdown
	if Global.boatDirection == 3 :
		pass
	#rightup
	if Global.boatDirection == 5 :
		pass
	#right
	if Global.boatDirection == 4 :
		pass
	#up
	if Global.boatDirection == 6 :
		pass
	#left
	if Global.boatDirection == 8 :
		pass
	#down
	if Global.boatDirection == 2 :
		pass
	
func _on_area_2d_mouse_entered() -> void:
	$LeftArrow.frame = 1
	print("UM hover pretty pleassseee")


func _on_area_2d_mouse_exited() -> void:
	$LeftArrow.frame = 0
	print("UM stop hovering u brat")
