extends Control

#var fullscreentrue = settingspref.get_value("fullscreen", fullscreen, null)
var fullscreen
var resolution
var settingspref = ConfigFile.new()

func _ready() -> void:
	load("user://settings.ini")
	$MarginContainer/TabContainer.current_tab = 0
#	if fullscreentrue == 1:
#		$MarginContainer/TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen/CheckButton.button_pressed = true
#	elif fullscreentrue == 0:
#		$MarginContainer/TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen/CheckButton.button_pressed = false

func _on_test_button_pressed() -> void:
	print("TestWorked")


func _on_check_button_toggled():
	if $MarginContainer/TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen/CheckButton.button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		settingspref.set_value("fullscreen", fullscreen, 1)
		settingspref.save("user://settings.ini")
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		settingspref.set_value("fullscreen", fullscreen, 0)
		settingspref.save("user://settings.ini")


func _on_option_button_item_selected(index) -> void:
	match index:
		0:
			print("1784 x 1004")
			DisplayServer.window_set_size(Vector2i(1784,1004))
		1:
			print("892 x 502")
			DisplayServer.window_set_size(Vector2i(892,502))
		2:
			print("446 x 251")
			DisplayServer.window_set_size(Vector2i(446,251))
	settingspref.set_value("resolution", resolution, index)


func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)
