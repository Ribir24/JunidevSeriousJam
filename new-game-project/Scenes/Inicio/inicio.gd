extends Node3D

const DIST:float=1000.0
var mouse:Vector2
var grabbed_object:Node3D=null

var crank_pressed:bool=false
var tv_pressed:bool=false
var magnet_found:bool=false

@export var crank:Node3D
@export var tv:Node3D
@export var well:Node3D
@export var trash:Node3D

@onready var trash_label:Label3D=trash.get_child(0).get_child(1)

@export var spot_light:SpotLight3D
@export var omni_light:OmniLight3D



const trash_items:Array=[
	"a toy horse",
	"a lever",
	"a dissected frog",
	"part of a bench",
	"a fly colony",
	"various assortments of beef",
	"half-eaten tacos",
	"soleless shoes",
	"a racoon",
	"a lot of crabs",
	"perfectly good forks"
]

var dialog_number:int=0
var trash_items_picked:int=0
var trash_items_max:int=5

func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_end)
func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and !event.pressed and event.button_index == 1:
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)
		_check_grabbed_object()

func _check_grabbed_object():
	if grabbed_object!=null:
		if grabbed_object==crank and not crank_pressed:
			var tween1 = create_tween()
			tween1.tween_property(spot_light, "light_energy", 0.0, 1.5)
			await tween1.finished
			
			await get_tree().create_timer(0.5).timeout
			
			var tween2 = create_tween()
			tween2.tween_property(omni_light, "light_energy", 1.0, 1.5)
			await tween2.finished
			
			tv.appear()
			crank_pressed=true
		elif not tv_pressed and grabbed_object==tv and tv.is_anim_finished():
			tv_pressed=true
			dialog_number+=1
			Dialogic.start("mayor_timeline")
		elif grabbed_object==well and well.is_anim_finished():
			if not magnet_found:
				dialog_number+=1
				Dialogic.start("well_timeline")
			else:
				get_tree().change_scene_to_file("res://Scenes/Iman/minijuego_iman.tscn")
		elif grabbed_object==trash and trash.is_anim_finished():
			_get_trash_item()

func _get_trash_item():
	trash_items_picked+=1
	if trash_items_picked<trash_items_max:
		trash_label.text="You found "+trash_items.pick_random()
	else:
		trash_label.text="You found a magnet"
		magnet_found=true

func _on_timeline_end():
	if dialog_number==1:
		well.appear()
	elif dialog_number==2:
		trash.appear()
		var tween = create_tween()
		tween.tween_property(trash, "global_position:y", 1.437, 0.1)
