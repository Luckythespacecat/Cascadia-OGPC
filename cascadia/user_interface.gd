extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeftArrow.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_area_2d_mouse_entered() -> void:
	$LeftArrow.frame = 1
	print("UM hover pretty pleassseee")


func _on_area_2d_mouse_exited() -> void:
	$LeftArrow.frame = 0
	print("UM stop hovering u brat")
