extends Node3D

const DIST:float=1000.0
var mouse:Vector2
var grabbed_object:Node3D=null

var crank_pressed:bool=false

@export var crank:Node3D
@export var tv:FirstTV

@export var spot_light:SpotLight3D
@export var omni_light:OmniLight3D


func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and !event.pressed and event.button_index == 1:
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)
		_check_grabbed_object()

func _check_grabbed_object():
	if grabbed_object!=null:
		if grabbed_object==crank and not crank_pressed:
			spot_light.visible=false
			omni_light.visible=true
			tv.appear()
			crank_pressed=true
		elif grabbed_object==tv and tv.is_anim_finished():
			print("MAYOR")
