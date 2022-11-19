extends RigidBody2D

@export var move_scene: PackedScene
@export var idle_scene: PackedScene

var happiness: int = 10


func _ready():
	add_child(move_scene.instantiate())
	add_child(idle_scene.instantiate())
