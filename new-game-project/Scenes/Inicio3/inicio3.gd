extends Node3D

const DIST:float=10000.0
var mouse:Vector2
var grabbed_object:Node3D=null

@export var first_tv:Node3D
@export var pozo:Node3D
@export var basura:Node3D

@export var super_market:Node3D
@export var anShop:Node3D
@export var SecondTV:Node3D
@export var label:Label3D
@export var manivela:Node3D
@export var exam:Node3D

var steps:int=4000000
var is_clicked:bool=false
var dialog:int = 0
var fun = true;
var platano = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_end)
	first_tv.appear(true)
	pozo.appear(true)
	basura.appear(true)
	manivela.appear()
	manivela.stop()
	super_market.set_speed(0.1)
	await get_tree().create_timer(1.5).timeout
	super_market.play_anim_string("Demolicion")
	await get_tree().create_timer(4.5).timeout
	anShop.appear()
	anShop.set_speed(0.2)

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
	if grabbed_object==anShop:
		if is_clicked and fun:
			Dialogic.start("anotherShopDialog1")
			fun = false
	elif grabbed_object == SecondTV and is_clicked and steps > 3999990:
		steps -= 1;
		print(steps)
		label.text = "Remaining steps\n" + str(steps) + "\nclick to take a step"
		if (steps <= 3999990):
			Dialogic.start("anotherShopDialog2")
			dialog += 1
	elif grabbed_object == manivela and is_clicked:
		if (steps <= 3999990 and steps > 0):
			if (!platano):
				manivela.c0ntinue()
				platano = true;
			else:
				manivela.play_anim_string("PutBanana")
				steps = -1;
		elif(steps <= -1):
			exam.appear()
			exam.set_speed(0.4)
	if grabbed_object == exam and is_clicked:
		get_tree().call_deferred("change_scene_to_file","res://Scenes/examen/examen.tscn")

func _on_timeline_end():
	if dialog == 0:
		SecondTV.appear()
	elif dialog == 1:
		SecondTV.disappear()
