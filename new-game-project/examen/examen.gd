extends Node3D

const DIST=1000.0
var mouse:Vector2
var grabbed_object:MeshInstance3D=null



func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and !event.pressed and event.button_index == 1:
		get_mouse_world_pos(mouse)

func get_mouse_world_pos(_mouse:Vector2):
	var space=get_world_3d().direct_space_state
	var start=get_viewport().get_camera_3d().project_ray_origin(mouse)
	var end=get_viewport().get_camera_3d().project_position(_mouse,DIST)
	var params=PhysicsRayQueryParameters3D.new()
	params.from=start
	params.to=end
	
	var result=space.intersect_ray(params)
	
	if result.is_empty()==false:
		grabbed_object=result.collider
