extends Node3D
class_name FirstTV

@export var anim_player:AnimationPlayer
var anim_finished:bool=false

func appear():
	anim_player.play("FirstTVAnim")
	

func is_anim_finished()->bool:
	return anim_finished

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	anim_finished=true
