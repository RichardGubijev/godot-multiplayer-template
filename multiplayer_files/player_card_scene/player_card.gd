extends Node

@onready var game: Node
@onready var panel: Panel = $player_card
@onready var texture_rect: TextureRect = $player_card/VBoxContainer/TextureRect
@onready var name_label: Label = $player_card/VBoxContainer/name_label
@onready var status_label: Label = $player_card/VBoxContainer/status_label
@onready var ready_button: Button = $player_card/VBoxContainer/ready_button

const NOT_READY = preload("res://multiplayer_files/player_card_scene/styles/not_ready.tres")
const READY = preload("res://multiplayer_files/player_card_scene/styles/ready.tres")

@export var ready_status: bool = false:
	set(value):
		ready_status = value
		call_deferred("update_status")

func _enter_tree() -> void:
	set_multiplayer_authority(int(str(name)))

func _ready():
	if is_multiplayer_authority():
		ready_button.disabled = false
		ready_button.show()
		game = get_tree().get_first_node_in_group("game")
		name_label.text = game.username
	update_status()
	
func _on_ready_button_pressed() -> void:
	ready_status = !ready_status

func update_status():
	if ready_status:
		status_label.text = "Ready"
		panel.add_theme_stylebox_override("panel", READY)
		ready_button.text = "Unready"
	else:
		status_label.text = "Not Ready"
		panel.add_theme_stylebox_override("panel", NOT_READY)
		ready_button.text = "Ready Up!"
