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
	super_market.set_speed(0.3)
	super_market.play_anim_string("Demolicion")
