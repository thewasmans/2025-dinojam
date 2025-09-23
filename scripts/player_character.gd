class_name PlayerCharacter 
extends CharacterBody3D

@export var speed:float = 10
@export var jump_speed:float = 20.0
@export var jump_speed_decrease:float = .1

var _gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply_gravity(delta:float)->void:
	velocity.y -= _gravity * delta * jump_speed_decrease

func apply_velocity_from_input()->void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
		
	var direction:float = Input.get_axis("backward", "forward")
	velocity.z = direction * speed
	position.x = 0

func _physics_process(delta:float)->void:
	apply_gravity(delta)
	apply_velocity_from_input()
	move_and_slide()
