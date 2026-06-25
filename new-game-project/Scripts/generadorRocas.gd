extends Node3D

@export var rock_scene: PackedScene
@export var key_scene:PackedScene
@export var spawn_interval: float = 1.5
@export var min_x: float = -5.0
@export var max_x: float = 5.0
@export var max_rocas:int=10

var timer: float = 0.0
var rocas:int=0

var timer_stop:bool=false

func _process(delta: float):
	if not timer_stop:
		timer += delta
	
	if timer >= spawn_interval:
		timer = 0.0
		spawn_rock()

func spawn_rock():
	if rocas<=max_rocas:
		var rock = rock_scene.instantiate()
		add_child(rock)
		
		var x = randf_range(min_x, max_x)
		rock.global_position = global_position
		rock.global_position.x = x
		rocas+=1
	else:
		var key=key_scene.instantiate()
		add_child(key)
		key.global_position.y=-30.0
		timer_stop=true
