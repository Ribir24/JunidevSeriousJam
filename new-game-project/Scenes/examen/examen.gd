extends Node3D

const DIST:float=1000.0
var mouse:Vector2
var grabbed_object:Node3D=null



func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and !event.pressed and event.button_index == 1:
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)
		change_answer()



func change_answer():
	if grabbed_object!=null:
		var pregunta:Node3D=grabbed_object.get_parent()
		for i in pregunta.get_children():
			i.change_sphere_visibility(false)
		grabbed_object.change_sphere_visibility(true)
		grabbed_object=null
