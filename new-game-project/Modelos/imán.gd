extends Node3D

@export var speed: float = 5.0
@export var min_x: float = -3.0
@export var max_x: float = 3.0

func _process(delta: float):
	if Input.is_action_pressed("LeftInput"):
		var direccion = -global_transform.basis.z
		global_position += direccion * speed * delta
	if Input.is_action_pressed("RightInput"):
		var direccion = global_transform.basis.z
		global_position += direccion * speed * delta
