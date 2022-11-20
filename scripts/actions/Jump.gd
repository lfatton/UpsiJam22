extends Node

var jump_speed = -400

var velocity = Vector2()

func jump():
	if get_parent().is_on_floor():
		var die = randi() % 2
		get_parent().velocity.y = jump_speed
		if (die < 1):
			get_parent().velocity.x = jump_speed / 2
		else: 
			get_parent().velocity.x = -jump_speed / 2
			get_parent().happiness -= 5
