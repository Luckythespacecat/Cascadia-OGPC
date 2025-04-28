extends Node2D

@onready var main_scene = preload("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("main_scene set in Inspector:", main_scene)
	if main_scene:
		var inst = main_scene.instantiate()
		print("Can instantiate main_scene:", inst)
	else:
		print("main_scene is NULL!")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position = lerp($Camera2D.position, $playerBody.position, 5 * delta)
	
	if Global.timeOfDay == "Night" :
		$Doorlight.energy = .15
	if Global.timeOfDay == "Day" :
		$Doorlight.energy = .35

func _on_door_area_body_entered(body: Node2D) -> void:
	if body.name == "playerBody":
		Global.SceneJustIn = "Lighthouse"
		print("Scene switching...")
		if main_scene:
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			print("main_scene is NULL")
