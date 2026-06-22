extends Node3D
class_name Casilla

@export var _sphere:MeshInstance3D


func change_sphere_visibility(value:bool):
	_sphere.visible=value
