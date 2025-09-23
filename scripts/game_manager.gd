class_name game_manager
extends Node

@export var death_area:DeathArea

@export var game_ui_death_prefab:PackedScene
var _game_ui_death:UIMenuDeath

func _ready()->void:
	_game_ui_death = game_ui_death_prefab.instantiate()
	add_child(_game_ui_death)
	_game_ui_death.visible = false
	death_area.player_death.connect(_on_player_death)
	_game_ui_death.button_restart.pressed.connect(procedure)

func _on_player_death()->void:
	Engine.time_scale = 0
	_game_ui_death.visible = true

func procedure()->void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
