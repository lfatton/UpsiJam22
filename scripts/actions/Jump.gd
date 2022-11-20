extends Node

var jump_speed = -400

var velocity = Vector2()
var jumping = false

func jump():
	if get_parent().is_on_floor():
		jumping = true
		get_parent().velocity.y = jump_speed
