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
	first_tv.speed_up()
	first_tv.appear()
	pozo.speed_up()
	pozo.appear()
	basura.speed_up()
	basura.appear()
	super_market.play_anim_string("SMOpen")



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
			print("SHOP")
		else:
			if super_market.is_anim_finished() and not door_open:
				door_open=true
				super_market.play_anim_string("SMAppear")
	else:
		if  super_market.is_anim_finished() and door_open:
			door_open=false
			super_market.play_anim_string("SMClose")
