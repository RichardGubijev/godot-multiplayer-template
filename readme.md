# Godot Multiplayer Template

This is a basic Godot 4 multiplayer template. It provides a foundation for multiplayer game development, including a main menu, settings menu, escape menu, and lobby functionality.

## Features

- Main menu
- Settings menu
- Escape menu
- Lobby system
- Built for Godot 4

## Requirements

- Godot 4

## Setup Instructions

1. **Change project name:**
   - Option 1: Using a text editor, edit the `project.godot` file and change the "config/name" value.
   - Option 2: Using Godot, edit the project name in Project Settings under config/name.

2. **Configure default PORT:**
   - Locate and edit the default PORT in `scripts/game`.

3. **Add your game scene:**
   - Add your scene to the multiplayer spawner in `multiplayer_files/game_scene/game.tscn`.
   - In `multiplayer_files/lobby_scene/lobby_scene.gd`, modify the `_on_start_game_button_pressed` function to load your game scene.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

The Godot Engine license can be found in the [godot-license.txt](godot-license) file.