extends Node3D

const DIST:float=1000.0
var mouse:Vector2
var grabbed_object:Node3D=null
var fin:bool = false

@export var min_x:float
@export var max_x:float

@export var scanner:Node3D

var scan_amount:int=0

func _ready() -> void:
	scanner.position.x = min_x;

func _process(_delta: float) -> void:
	if grabbed_object==scanner:
		scanner.global_position.x=InteractManager.get_grab_position(mouse,scanner.global_position.z)-20.5
		#print(scanner.global_position)
		if scanner.global_position.x<min_x:
			scanner.global_position.x=min_x
		elif scanner.global_position.x>max_x:
			scanner.global_position.x=max_x
			_check_bar()

func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and !fin:
		grabbed_object=InteractManager.get_mouse_world_pos(mouse,DIST)

func _check_bar():
	if scan_amount<3:
		grabbed_object=null
		scanner.play_anim_string("ERROR")
		await get_tree().create_timer(1.0).timeout
		scanner.global_position.x=min_x
		scan_amount+=1
	else:
		scanner.play_anim_string("FINAL")
		grabbed_object = null;
		fin = true;
		await get_tree().create_timer(1.5).timeout
		print("FINAL")
