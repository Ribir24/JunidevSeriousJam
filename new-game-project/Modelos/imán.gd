extends Node3D

@export var speed: float = 5.0
@export var min_x: float = -3.0
@export var max_x: float = 3.0

func _input(event):
	if Input.is_action_pressed("LeftInput"):
		print("left")
