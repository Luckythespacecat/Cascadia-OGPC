extends Sprite2D

var TargetPos : Vector2 = Vector2(Global.PlayerX, Global.PlayerY)
var TargetX = TargetPos.x
var TargetY = TargetPos.y
var MoveX = 0
var MoveY = 0
var NewPosX = 0
var CurrentPos : Vector2 = self.position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the eslapsed time since the previous frame.
func _process(delta: float) -> void:
	CurrentPos = self.position
	TargetPos = Vector2(Global.PlayerX, Global.PlayerY)
	TargetX = TargetPos.x
	TargetY = TargetPos.y
	
	if CurrentPos.x > TargetX :
		MoveX -= 1
	if CurrentPos.x < TargetX :
		MoveX += 1
		


func _on_interval_timeout() -> void:
	NewPosX = CurrentPos.x + MoveX
	self.position = Vector2(NewPosX,-20)
