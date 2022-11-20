extends Node

func stop():
	get_parent().happiness -= 1
	get_parent().velocity.x = 0
	get_parent().velocity.y = 0
