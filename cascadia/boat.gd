extends Node2D

var rand

func _ready():
	$Timer.start()

func _process(delta: float) -> void:
	BoatToPlayer()

func BoatToPlayer1():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Global.PlayerPos, 1).set_trans(Tween.TRANS_LINEAR)
		
func BoatToPlayer2():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Global.PlayerPos, 5).set_trans(Tween.TRANS_LINEAR)

func BoatToPlayer():
	if rand == 1:
		BoatToPlayer1()
	if rand == 0:
		BoatToPlayer2()

func PlayerExited():
	pass

func _on_area_2d_area_exited(area: Area2D) -> void:
	PlayerExited()
	
func randomgen():
	rand = randi_range(0, 1)


func _on_timer_timeout() -> void:
	randomgen()
