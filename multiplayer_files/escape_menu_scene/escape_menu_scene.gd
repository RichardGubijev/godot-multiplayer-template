extends Control

func _ready() -> void:
	self.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape_menu"):
		self.visible = !self.visible 

func _on_resume_button_pressed() -> void:
	self.hide()


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
