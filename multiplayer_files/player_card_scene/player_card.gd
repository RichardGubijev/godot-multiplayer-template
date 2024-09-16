extends Panel

@onready var panel: Panel = $"."
@onready var texture_rect: TextureRect = $VBoxContainer/TextureRect
@onready var name_label: Label = $VBoxContainer/name_label
@onready var status_label: Label = $VBoxContainer/status_label
@onready var ready_button: Button = $VBoxContainer/ready_button

const NOT_READY = preload("res://multiplayer_files/player_card_scene/styles/not_ready.tres")
const READY = preload("res://multiplayer_files/player_card_scene/styles/ready.tres")

var ready_status: bool = false
var username: String = "User":
	set(value):
		name_label.text = value
		username = value

func _ready() -> void:
	pass

func _on_ready_button_pressed() -> void:
	update_status()

func update_status():
	if ready_status:
		ready_status = false
		status_label.text = "Not Ready"
		panel.add_theme_stylebox_override("panel", NOT_READY)
		ready_button.text = "Ready Up!"
	else:
		ready_status = true
		status_label.text = "Ready"
		panel.add_theme_stylebox_override("panel", READY)
		ready_button.text = "Unready"
		
 
