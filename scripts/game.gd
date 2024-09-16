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
	print(id)

# CLIENT SIGNALS

func connected_to_server():
	main_menu.hide()

func connection_failed():
	pass

func server_disconnected():
	main_menu.show()
