extends RigidBody2D

@export var move_scene: PackedScene

var happiness: int = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	var move_action = move_scene.instantiate()
	add_child(move_action)


