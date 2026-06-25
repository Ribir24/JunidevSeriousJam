extends Node3D

@export var speed: float = 4.0
@export var max_height: float = 20.0

#func _ready():
	#add_to_group("roca")

func _process(delta: float):
	global_position.y += speed * delta
	
	if global_position.y >= max_height:
		queue_free()
