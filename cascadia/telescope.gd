extends Node2D

var PlayerEntered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerEntered == true:
		if Input.is_action_just_pressed("interact") :
			if Global.partNumb == 0:
				Global.partNumb = 1
				
			elif Global.partNumb == 1 and Global.part1Obtained == true :
				Global.partNumb = 2
				
			elif Global.partNumb == 2 and Global.part2Obtained == true :
				Global.partNumb = 3
				
			elif Global.partNumb == 3 and Global.part3Obtained == true :
				print("End of game")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 2

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "FootArea" :
		z_index = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "playerBody" :
		PlayerEntered = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "playerBody" :
		PlayerEntered = false
