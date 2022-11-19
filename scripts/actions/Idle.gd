extends Node

var time_between_moves: float = 2.0
var time_since_last_move: float = 0
var speed: float = 0
var velocity: Vector2 = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_last_move += delta
	if (time_between_moves <= time_since_last_move):
		time_since_last_move = 0
		time_between_moves = randf_range(1, 5)
		speed = randf_range(-3000, 3000)
		velocity = Vector2(speed, 0)
		print(velocity, time_between_moves)
	move()

func move():
	get_parent().add_constant_central_force(velocity)

