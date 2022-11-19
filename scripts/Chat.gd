extends CharacterBody2D

@export var move_scene: PackedScene
@export var idle_scene: PackedScene

var happiness: int = 10


func make_material():
	var new_material = get_material().duplicate()
	new_material.set_shader_parameter("main_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("eye_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("ear_color", Vector4(randf(), randf(), randf(), 1.0))
	return new_material
	

func _ready():
	add_child(move_scene.instantiate())
	add_child(idle_scene.instantiate())
	
	$Body.set_material(make_material())
	$Head.set_material(make_material())
	$Tail.set_material(make_material())
