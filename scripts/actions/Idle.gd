extends Node

var gravity: Vector2 = Vector2(0, 981)


func _ready():
	get_parent().add_constant_central_force(gravity)
