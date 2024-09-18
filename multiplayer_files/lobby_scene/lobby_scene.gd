extends Control

@onready var start_game_button: Button = $start_game_button
@onready var hbox_container: HBoxContainer = $HBoxContainer
var player_card_scene: PackedScene = preload("res://multiplayer_files/player_card_scene/player_card.tscn")

func _ready() -> void: 
	if is_multiplayer_authority():
		multiplayer.peer_connected.connect(add_player)
		var connected_players = multiplayer.get_peers()
		connected_players.append(1)
		for p in connected_players:
			add_player(p)
		start_game_button.show()

func add_player(id: int):
	var player = player_card_scene.instantiate()
	player.name = str(id)
	hbox_container.add_child(player)

func _process(_delta: float) -> void:
	var all_ready: bool = true
	var players = hbox_container.get_children()
	for p in players:
		if not p.ready_status:
			all_ready = false
	if all_ready and len(players) >= 2:
		start_game_button.disabled = false

func _on_start_game_button_pressed() -> void:
	queue_free()
	# Insert loading a new scene here

