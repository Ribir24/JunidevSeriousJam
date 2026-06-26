extends Node3D


const DIST:float=10000.0
var mouse:Vector2
var grabbed_object:Node3D=null

@export var first_tv:Node3D
@export var pozo:Node3D
@export var basura:Node3D

@export var super_market:Node3D

var is_clicked:bool=false

var door_open:bool=false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_tv.appear(true)
	pozo.appear(true)
	basura.appear(true)
	super_market.play_anim_string("SMOpen")
	super_market.set_speed(0.2)
	super_market.stop()
	await get_tree().create_timer(1.5).timeout
	super_market.c0ntinue()
	



func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)
	if event is InputEventMouseButton and !event.pressed and event.button_index == 1:
		is_clicked=true
	else:
		is_clicked=false
	_check_grabbed_object()

func _check_grabbed_object():
	if grabbed_object==super_market:
		if is_clicked:
			get_tree().call_deferred("change_scene_to_file","res://Scenes/Escaner/minijuego_escaner.tscn")
		else:
			if super_market.is_anim_finished() and not door_open:
				door_open=true
				super_market.set_speed(1.0)
				super_market.play_anim_string("SMAppear")
	else:
		if  super_market.is_anim_finished() and door_open:
			door_open=false
			super_market.play_anim_string("SMClose")
