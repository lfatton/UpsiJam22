extends Node

var time_between_moves: float = 0.2
var time_since_last_move: float = 0


func _process(delta):
	time_since_last_move += delta

	if time_between_moves <= time_since_last_move:
		time_since_last_move = 0
		time_between_moves = randf_range(1, 5)

		get_parent().velocity.x = randf_range(-300, 300)
		if get_parent().velocity.x < 0:
			get_parent().scale.y = -1 * abs(get_parent().scale.y)
			get_parent().rotation = PI
		else:
			get_parent().scale.y = 1 * abs(get_parent().scale.y)
			get_parent().rotation = 0
