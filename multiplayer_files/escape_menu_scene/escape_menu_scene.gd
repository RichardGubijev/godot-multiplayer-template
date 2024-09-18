extends Control

func _ready() -> void:
		self.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape_menu"):
		if get_parent().has_node("SettingsMenuScene"):
			get_parent().get_node("SettingsMenuScene").queue_free()
		else:
			self.visible = !self.visible 

func _on_resume_button_pressed() -> void:
	self.hide()

func _on_settings_button_pressed() -> void:
	get_tree().get_first_node_in_group("game").load_settings_menu()
	self.hide()

func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
