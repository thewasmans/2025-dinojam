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
	
	get_creatures()

func _on_player_death()->void:
	Engine.time_scale = 0
	_game_ui_death.visible = true

func procedure()->void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	
func get_creatures()->void:
	var creatures:Array[Node] = get_tree().get_nodes_in_group("creatures")
	
	for creature in creatures:
		if creature is CreatureDino:
			creature.character_entered.connect(_on_player_death)
	
