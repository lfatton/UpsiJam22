extends Node

var time_between_moves: float = 0.2
var time_since_last_move: float = 0
var velocity: Vector2 = Vector2(0, 0)


func _process(delta):
	time_since_last_move += delta

	if (time_between_moves <= time_since_last_move):
		time_since_last_move = 0
		time_between_moves = randf_range(1, 5)
		velocity = Vector2(randf_range(300, 300) * delta, 0)

		if (velocity.x < 0):
			get_parent().scale.x = -1
		else:
			get_parent().scale.x = 1


func _physics_process(delta):
	get_parent().move_and_collide(velocity)
