extends Control


func _on_exit_button_button_down() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
