extends DirectionalLight2D

var cycle_duration: float = 20.0

@export var night_duration = 5.0
@export var day_duration = 5.0
var sunrise_duration = 5.0
var sunset_duration = 5.0

@export var night_color := Color(0.5, 1, 2)
@export var day_color := Color(1.0, 0.95, 0.8)
var sunrise_color := Color(1.0, 0.6, 0.3)
var sunset_color := Color(1.0, 0.4, 0.3)

var night_energy := -20
var day_energy := 0.5
var sunrise_energy := 0.5
var sunset_energy := 0.5

var night_angle := deg_to_rad(-90)
var day_angle := deg_to_rad(45)
var sunrise_angle := deg_to_rad(0)
var sunset_angle := deg_to_rad(0)

var light_2d: DirectionalLight2D

var time_passed := 0.0
var _current_time = time_passed

func _ready():
	light_2d = self 

func _process(delta) -> void:
	time_passed = fmod(time_passed + delta, cycle_duration)
	_current_time = time_passed
	cycle()

func cycle():
	if _current_time < night_duration:
		_apply_phase(night_color, night_energy, night_angle)
	elif _current_time < night_duration + sunrise_duration:
		var t = (_current_time - night_duration) / sunrise_duration
		_interpolate_phase(night_color, sunrise_color, night_energy, sunrise_energy, night_angle, sunrise_angle, t)
	elif _current_time < night_duration + sunrise_duration + day_duration:
		_apply_phase(day_color, day_energy, day_angle)
	elif _current_time < cycle_duration:
		var t = (_current_time - night_duration - sunrise_duration - day_duration) / sunset_duration
		_interpolate_phase(day_color, sunset_color, day_energy, sunset_energy, day_angle, sunset_angle, t)
	else:
		_apply_phase(night_color, night_energy, night_angle)

func _apply_phase(color: Color, energy: float, angle: float):
	light_2d.color = color
	light_2d.energy = energy
	light_2d.rotation = angle

func _interpolate_phase(from_color: Color, to_color: Color, from_energy: float, to_energy: float, from_angle: float, to_angle: float, t: float):
	light_2d.color = from_color.lerp(to_color, t)
	light_2d.energy = lerp(from_energy, to_energy, t)
	light_2d.rotation = lerp(from_angle, to_angle, t)
