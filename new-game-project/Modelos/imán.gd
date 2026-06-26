extends Node3D

@export var speed: float = 8.0
@export var min_x: float = -12.0
@export var max_x: float = 12.0

var area:Area3D

func _ready() -> void:
	area=$Area3D
	area.area_entered.connect(_on_area_3d_body_entered)

func _process(delta: float):
	if Input.is_action_pressed("LeftInput"):
		var direccion = global_transform.basis.x
		global_position += direccion * speed * delta
	if Input.is_action_pressed("RightInput"):
		var direccion = -global_transform.basis.x
		global_position += direccion * speed * delta
		
	
	global_position.x = clamp(global_position.x, min_x, max_x)

func _on_area_3d_body_entered(body: Node3D):
	if body.is_in_group("key"):
		get_tree().call_deferred("change_scene_to_file","res://Scenes/Inicio2/inicio_2.tscn")
	else:
		get_tree().call_deferred("reload_current_scene")
