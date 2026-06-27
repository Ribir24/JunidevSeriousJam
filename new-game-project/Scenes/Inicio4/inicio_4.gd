extends Node3D

const DIST:float=10000.0
var mouse:Vector2
var grabbed_object:Node3D=null

@export var first_tv:Node3D
@export var pozo:Node3D
@export var basura:Node3D
@export var anShop:Node3D
@export var manivela:Node3D
@export var exam:Node3D
@export var congrats:Node3D
var is_clicked:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_tv.appear(true)
	pozo.appear(true)
	basura.appear(true)
	manivela.appearName("Break")
	manivela.appear(true)
	anShop.appear(true)
	exam.appear(true)

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
	if grabbed_object == manivela and is_clicked:
		manivela.set_speed(0.3)
		manivela.play_anim_string("Spin")
		await get_tree().create_timer(1.5).timeout
		var tween = create_tween()
		tween.tween_property(congrats, "global_position:y", 7.376, 1.5)
