extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.custcene == 0 :
		self.global_position = $/root/Main/Lamprey.global_position
		if zoom.x < 6.0:
			zoom.x = lerp(zoom.x, 6.0, delta / 4)
		if zoom.y < 6.0:
			zoom.y = lerp(zoom.y, 6.0, delta / 4 )
	if Global.custcene == 1 :
		CameraToPlayer()
		if zoom.y > 3.0 or  zoom.y < 3.0:
			zoom.y = lerp(zoom.y, 3.0, delta / 4 )
		if zoom.x > 3.0 or  zoom.x < 3.0:
			zoom.x = lerp(zoom.x, 3.0, delta / 4)

		


#Creating a tween, 'tween the camera and player
func CameraToPlayer() :
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Global.PlayerPos, .6).set_trans(Tween.TRANS_LINEAR)
