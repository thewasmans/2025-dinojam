class_name DeathArea
extends Area3D

signal player_death

@export var position_area:Vector3
@export var scale_area:Vector3
@export var model_3d:Node3D
@export var debug:bool

func _ready()->void:
	model_3d.visible = debug

func _on_body_entered(body:Node3D)->void:
	if body as PlayerCharacter : player_death.emit()

func _on_player_death()->void:
	get_tree().reload_current_scene()
