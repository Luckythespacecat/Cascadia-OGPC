extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CameraToPlayer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Interval.start()
	CameraToPlayer()


func _on_interval_timeout() -> void:
	#CameraToPlayer()
	pass

func CameraToPlayer() :
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Global.PlayerPos, .6).set_trans(Tween.TRANS_LINEAR)
