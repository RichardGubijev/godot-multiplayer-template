extends Control

@onready var ip_line: LineEdit = $VBoxContainer/HBoxContainer/ip_line
@onready var game: Node = $".."

@onready var username_line: LineEdit = $VBoxContainer2/HBoxContainer2/username_line
@onready var username_label: Label = $VBoxContainer2/HBoxContainer/username_label

var lobby_scene: PackedScene = preload("res://multiplayer_files/lobby_scene/lobby_scene.tscn")
var escape_menu_scene: PackedScene = preload("res://multiplayer_files/escape_menu_scene/escape_menu_scene.tscn")

var PORT = 25565

func _ready() -> void:
	username_label.text = game.username

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_host_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new() 
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	var lobby = lobby_scene.instantiate()
	game.add_child(lobby)
	game.remove_child(self)
	load_escape_menu()

func _on_join_button_pressed() -> void:
	var peer = ENetMultiplayerPeer.new() 
	peer.create_client(ip_line.text, PORT)
	multiplayer.multiplayer_peer = peer
	load_escape_menu()

func _on_set_username_button_pressed() -> void:
	game.username = username_line.text
	username_label.text = game.username

func load_escape_menu():
	var escape_menu = escape_menu_scene.instantiate()
	game.add_child(escape_menu)