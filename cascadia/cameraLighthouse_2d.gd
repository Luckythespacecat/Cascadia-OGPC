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
	pass

	if shake_strength > 0 :
		shake_strength = lerpf(shake_strength, 0 ,shakeFade * delta)
	
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))
