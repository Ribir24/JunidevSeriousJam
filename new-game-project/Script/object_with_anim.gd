extends Node


@export var anim_player:AnimationPlayer
@export var anim_name:String
var anim_finished:bool=false

func appear():
	anim_player.play(anim_name)
	anim_player.animation_finished.connect(_on_anim_finish)

func is_anim_finished()->bool:
	return anim_finished

func _on_anim_finish(_anim_name: StringName) -> void:
	anim_finished=true
