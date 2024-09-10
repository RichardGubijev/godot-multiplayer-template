extends Control

@onready var ip_line: LineEdit = $VBoxContainer/HBoxContainer/ip_line

var PORT = 25565

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_host_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new() 
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	self.hide()

func _on_join_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new() 
	peer.create_client(ip_line.text, PORT)
	multiplayer.multiplayer_peer = peer

