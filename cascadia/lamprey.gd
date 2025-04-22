extends Node2D

@export var head_path: NodePath
@export var segment_count: int = 30
@export var follow_speed: float = 0.4

var head: Node2D
var trail: Array[Vector2] = []

func _ready():
	head = get_node(head_path)
	trail.resize(segment_count)
	for i in trail.size():
		trail[i] = head.global_position

func _process(delta):
	# Update trail positions
	for i in range(trail.size() - 1, 0, -1):
		trail[i] = trail[i].lerp(trail[i - 1], follow_speed)
	trail[0] = head.global_position

	# Update line points
	var line = $Line2D
	line.clear_points()
	for point in trail:
		line.add_point(to_local(point))
