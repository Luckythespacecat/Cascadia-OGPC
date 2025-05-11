extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#for area in $DealerShipArea.get_overlapping_areas() :
		#if area.name == "BoatArea2D2" or "BodyArea" :
			#z_index = 0
		#else: 
			#z_index = 1000S
