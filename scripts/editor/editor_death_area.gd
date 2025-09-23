@tool
extends Node

@export var death_area:DeathArea
@export var collision_shape:CollisionShape3D
@export var box_shape:BoxShape3D

func _process(_delta:float)->void:
	if Engine.is_editor_hint():
		box_shape.size = death_area.scale_area
		collision_shape.position = death_area.position_area
		death_area.model_3d.scale = box_shape.size
		death_area.model_3d.position = collision_shape.position
