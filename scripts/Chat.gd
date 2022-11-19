extends RigidBody2D

var happiness: int = 10
var time_between_moves: float = 2.0
var time_since_last_move: float = 0
var speed: float = 0
var velocity: Vector2 = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_last_move += delta
	if (time_between_moves <= time_since_last_move):
		time_since_last_move = 0
		time_between_moves = randf_range(1, 5)
		speed = randf_range(-10, 10)
		velocity = Vector2(300 * speed * delta, 1)
		if (velocity.x < 0):
			scale.x = -1
		else:
			scale.x = 1
	if (velocity.x != 0 && velocity.y != 0):
		move_and_collide(velocity)
