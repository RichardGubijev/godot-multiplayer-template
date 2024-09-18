extends Control

@onready var hbox_container: HBoxContainer = $HBoxContainer
var player_card_scene: PackedScene = preload("res://multiplayer_files/player_card_scene/player_card.tscn")

func _ready() -> void: 
	if is_multiplayer_authority():
		multiplayer.peer_connected.connect(add_player)
		var connected_players = multiplayer.get_peers()
		connected_players.append(1)
		for p in connected_players:
			add_player(p)

func add_player(id: int):
	var player = player_card_scene.instantiate()
	player.name = str(id)
	hbox_container.add_child(player)