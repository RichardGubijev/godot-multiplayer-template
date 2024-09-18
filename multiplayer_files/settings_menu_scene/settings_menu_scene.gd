extends Control

func _on_example_slider_value_changed(value:float) -> void:
	print(value)

func _on_close_settings_button_pressed() -> void:
	queue_free()
