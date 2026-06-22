extends Node3D

@export var rock_scene: PackedScene
@export var spawn_interval: float = 1.5
@export var min_x: float = -5.0
@export var max_x: float = 5.0

var timer: float = 0.0

func _process(delta: float):
	timer += delta
	
	if timer >= spawn_interval:
		timer = 0.0
		spawn_rock()

func spawn_rock():
	var rock = rock_scene.instantiate()
	add_child(rock)
	
	var x = randf_range(min_x, max_x)
	rock.global_position = global_position
	rock.global_position.x = x
