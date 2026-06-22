extends Node3D


func get_mouse_world_pos(_mouse:Vector2,DIST:float)->Node3D:
	var space=get_world_3d().direct_space_state
	var start=get_viewport().get_camera_3d().project_ray_origin(_mouse)
	var end=get_viewport().get_camera_3d().project_position(_mouse,DIST)
	var params=PhysicsRayQueryParameters3D.new()
	params.from=start
	params.to=end
	
	var result=space.intersect_ray(params)
	
	if result.is_empty()==false:
		return result.collider.get_parent().get_parent()
	else:
		return null
