extends Node

@onready var main_menu: Control = $main_menu
@onready var username: String

func _enter_tree() -> void:
	username = str((randi() % 2000) + 1000) 

func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	multiplayer.server_disconnected.connect(server_disconnected)
# SERVER SIGNALS

func peer_connected(id: int):
	print("Player ", id, " connected") 

func peer_disconnected(id: int):
	print("Player ", id, " disconnected") 

# CLIENT SIGNALS

func connected_to_server():
	remove_child(main_menu)

func connection_failed():
	pass

func server_disconnected():
	add_child(main_menu)

# Menus

func load_escape_menu():
	var escape_menu_scene: PackedScene = preload("res://multiplayer_files/escape_menu_scene/escape_menu_scene.tscn")
	var escape_menu = escape_menu_scene.instantiate()
	add_child(escape_menu)

func load_settings_menu():
	var settings_menu_scene: PackedScene = preload("res://multiplayer_files/settings_menu_scene/settings_menu_scene.tscn")
	var settings_menu = settings_menu_scene.instantiate()
	add_child(settings_menu)
