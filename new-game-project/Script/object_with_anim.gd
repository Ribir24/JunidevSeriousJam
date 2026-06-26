extends Node


@export var anim_player:AnimationPlayer
@export var anim_name:String
var anim_finished:bool=false
var auxVel:float=0.0

func _ready() -> void:
	anim_player.animation_finished.connect(_on_anim_finish)

func appear(finished:bool = false):
	anim_player.play(anim_name)
	if finished:
		anim_player.seek(100, true);

func play_anim_string(anim:String):
	anim_player.play(anim)

func is_anim_finished()->bool:
	return anim_finished

func _on_anim_finish(_anim_name: StringName) -> void:
	anim_finished=true

func speed_up():
	anim_player.speed_scale=1000
func set_speed(val:float):
	anim_player.speed_scale=val
func stop():
	auxVel = anim_player.speed_scale
	anim_player.speed_scale = 0
func c0ntinue():
	anim_player.speed_scale = auxVel
