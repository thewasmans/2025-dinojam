class_name EndPlateform
extends Area3D

@export var mesh:Node3D

func _ready()->void:
	mesh.visible = false

func _on_area_entered(area:Area3D)->void:
	if area is CreatureDino:
		(area as CreatureDino).invert_direction_moving()
