extends Camera2D

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength = 0
var damagedNum = 0
var CompareDamageNum = 0
var CameraZoom = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func apply_shake() :
	shake_strength = randomStrength 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.YOUATETHESQUID == true :
		Global.cutscene = 3
	
	if damagedNum < Global.damage :
		randomStrength = 30
		apply_shake()

	damagedNum = Global.damage

	if Global.Hunger < 40 :
		randomStrength = 15
		apply_shake()

	if shake_strength > 0 :
		shake_strength = lerpf(shake_strength, 0 ,shakeFade * delta)
	
		offset = randomOffset()
	
	if Global.cutscene == 0 :
		self.global_position = $/root/Main/Lamprey.global_position
		if zoom.x < 4.0:
			zoom.x = lerp(zoom.x, 4.0, delta / 4)
		if zoom.y < 4.0:
			zoom.y = lerp(zoom.y, 4.0, delta / 4 )
	if Global.cutscene == 1 :
		CameraToPlayer()
		if zoom.y > 1.75 or  zoom.y < 1.75:
			zoom.y = lerp(zoom.y, 1.75, delta / 4 )
		if zoom.x > 1.75 or  zoom.x < 1.75:
			zoom.x = lerp(zoom.x, 1.75, delta / 4)
	if Global.cutscene == 3:
		CameraToPlayer()
		zoom.x = lerp(zoom.x, 7.0, delta / 8)
		zoom.y = lerp(zoom.y, 7.0, delta / 8 )


func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))
#Creating a tween, 'tween the camera and player
func CameraToPlayer() :
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Global.PlayerPos, .6).set_trans(Tween.TRANS_LINEAR)
