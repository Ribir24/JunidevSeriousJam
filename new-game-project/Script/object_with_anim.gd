extends Node


@export var anim_player:AnimationPlayer
@export var anim_name:String
var anim_finished:bool=false

func _ready() -> void:
	anim_player.animation_finished.connect(_on_anim_finish)

func appear():
	anim_player.play(anim_name)
	

func play_anim_string(anim:String):
	anim_player.play(anim)

func is_anim_finished()->bool:
	return anim_finished

func _on_anim_finish(_anim_name: StringName) -> void:
	anim_finished=true

func speed_up():
	anim_player.speed_scale=1000
