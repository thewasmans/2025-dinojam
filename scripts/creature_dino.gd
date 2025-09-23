class_name CreatureDino
extends Area3D

signal character_entered

@export var speed:float = 1.0

func _on_body_entered(body:Node3D)->void:
	if body is PlayerCharacter:
		character_entered.emit()
		
		

func _process(delta:float)->void:
	position.z -= delta * speed
	
	
func invert_direction_moving()->void:
	speed = -speed
	rotate(Vector3.UP, PI)
