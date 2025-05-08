extends Node2D

var move : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Meridith.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Meridith.position.y < -400 :
		move = 5
	if move == 1:
		$Camera2D.position = lerp($Camera2D.position, Vector2(0,0), delta /4)
	elif move == 2:
		$CanvasLayer/Rope.position.y = lerpf($CanvasLayer/Rope.position.y, 350, delta )
	elif move == 3 :
		$Meridith.play("HoldOn")
		if $Meridith.frame == 2 :
			$Meridith.pause()
			move = 4
	elif move == 4:
		$CanvasLayer/Rope.position.y = lerpf($CanvasLayer/Rope.position.y, -683.0, delta / 2)
		$Meridith.position.y = lerpf($Meridith.position.y, -483.0, delta / 2 )
	elif move == 5:
		$CanvasLayer/Helicopter.position.x += 5

func _on_fly_in_timeout() -> void:
	if move == 1:
		move = 2


func _on_rope_done_timeout() -> void:
	move = 3 
	
