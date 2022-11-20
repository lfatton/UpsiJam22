extends CharacterBody2D

@export var move_scene: PackedScene
@export var idle_scene: PackedScene
@export var jump_scene: PackedScene

var jump_instance

var happiness: int = 100


func _process(delta):
	var die = randi() % 100
	
	if (die == 6):
		jump_instance.jump()
	check_happiness()


func make_material():
	var new_material = get_material().duplicate()
	new_material.set_shader_parameter("main_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("secondary_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("eye_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("ear_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("seed", randf())
	return new_material
	

func _ready():
	jump_instance = jump_scene.instantiate()
	
	add_child(move_scene.instantiate())
	add_child(idle_scene.instantiate())
	add_child(jump_instance)
	
	_set_materials()
	#_randomize_body_parts()
	
	
func _set_materials():
	$Body.set_material(make_material())
	$Head.set_material(make_material())
	$Tail.set_material(make_material())
	$HappyTail.set_material(make_material())
	$RabaTail.set_material(make_material())


func _randomize_body_parts():
	var die = randi() % 100
	
	if die < 5:
		remove_child($Tail)
		remove_child($HappyTail)
	elif die < 50:
		remove_child($HappyTail)
		remove_child($RabaTail)
	else:
		remove_child($Tail)
		remove_child($RabaTail)
		if die < 75:
			$HappyTail.scale.y *= -1


func check_happiness():
	if happiness >= 60:
		$Tail.hide()
		$RabaTail.hide()
		$HappyTail.show()
	elif happiness < 60 and happiness > 0:
		$HappyTail.hide()
		$RabaTail.hide()
		$Tail.show()
	elif happiness <= 0 and happiness > -50:
		$Tail.hide()
		$RabaTail.hide()
		$HappyTail.show()
		if ($HappyTail.scale.y < 0):
			$HappyTail.scale.y *= -1
	elif happiness <= -50:
		$HappyTail.hide()
		$Tail.hide()
		$RabaTail.show()
		
