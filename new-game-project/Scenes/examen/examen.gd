extends Node3D

const DIST:float=1000.0
var mouse:Vector2
var grabbed_object:Node3D=null

@export var upper_limit:float
@export var lower_limit:float

@export var button_up:BaseButton
@export var button_down:BaseButton
@export var button_finish:BaseButton

@export var camera:Camera3D

var pressed:bool=false

func _ready() -> void:
	button_finish.pressed.connect(_finish)


func _process(_delta: float) -> void:
	if pressed:
		if button_up.is_hovered():
			_rise()
		elif button_down.is_hovered():
			_fall()

func _rise():
	if button_finish.visible:
		button_finish.visible=false
	camera.position.y+=0.1
	if camera.position.y>upper_limit:
		camera.position.y=upper_limit

func _fall():
	camera.position.y-=0.1
	if camera.position.y<lower_limit:
		camera.position.y=lower_limit
		button_finish.visible=true

func _finish():
	print("FINISHED")
	get_tree().call_deferred("change_scene_to_file","res://Scenes/Inicio4/inicio_4.tscn")

func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)
		change_answer()
		pressed = true
	else:
		pressed=false



func change_answer():
	if grabbed_object!=null:
		var pregunta:Node3D=grabbed_object.get_parent()
		for i in pregunta.get_children():
			i.change_sphere_visibility(false)
		grabbed_object.change_sphere_visibility(true)
		grabbed_object=null
