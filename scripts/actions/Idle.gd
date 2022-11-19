extends Node

var gravity: float = 981


func _physics_process(delta):
	get_parent().velocity.y += delta * gravity
	get_parent().move_and_slide()
