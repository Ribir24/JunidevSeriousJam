extends Node3D

@export var speed: float = 8.0
@export var min_x: float = -12.0
@export var max_x: float = 12.0
@export var base: PackedScene

func _process(delta: float):
	if Input.is_action_pressed("LeftInput"):
		var direccion = global_transform.basis.x
		global_position += direccion * speed * delta
	if Input.is_action_pressed("RightInput"):
		var direccion = -global_transform.basis.x
		global_position += direccion * speed * delta
		
	
	global_position.x = clamp(global_position.x, min_x, max_x)

func _on_area_3d_body_entered(body: Node3D):
	if body.is_in_group("roca"):
		get_tree().change_scene_to_packed(base)
