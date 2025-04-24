extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeftArrow.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#left down
	if Global.boatDirection == 1 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-225.0), 2 * delta)
	#leftup
	if Global.boatDirection == 7 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-135), 2 * delta)
	#rightdown
	if Global.boatDirection == 3 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-315.0), 2 * delta)
	#rightup
	if Global.boatDirection == 5 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-45), 2 * delta)
	#right
	if Global.boatDirection == 4 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(0), 2 * delta)
	#up
	if Global.boatDirection == 6 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-90), 2 * delta)
	#left
	if Global.boatDirection == 8 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-180), 2 * delta)
	#down
	if Global.boatDirection == 2 :
		$Point.rotation = lerp($Point.rotation, deg_to_rad(-270.0), 2 * delta)
	
func _on_area_2d_mouse_entered() -> void:
	$LeftArrow.frame = 1
	print("UM hover pretty pleassseee")


func _on_area_2d_mouse_exited() -> void:
	$LeftArrow.frame = 0
	print("UM stop hovering u brat")
