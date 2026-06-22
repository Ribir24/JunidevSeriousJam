extends Node3D

@export var speed: float = 8.0
@export var min_x: float = -12.0
@export var max_x: float = 12.0

func _process(delta: float):
	if Input.is_action_pressed("LeftInput"):
		var direccion = global_transform.basis.x
		global_position += direccion * speed * delta
	if Input.is_action_pressed("RightInput"):
		var direccion = -global_transform.basis.x
		global_position += direccion * speed * delta
		
	global_position.x = clamp(global_position.x, min_x, max_x)
