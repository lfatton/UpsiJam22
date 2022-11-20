extends CharacterBody2D

@export var move_scene: PackedScene
@export var idle_scene: PackedScene
@export var jump_scene: PackedScene
@export var stop_scene: PackedScene
@export var teleport_scene: PackedScene

var jump_instance
var stop_instance
var teleport_instance

var happiness: int = 100
var isFeral = false
var iamraba: bool = false


func _process(delta):
	var die = randi() % 100
	
	if (die == 6):
		jump_instance.jump()
	check_happiness()


func make_material(pattern_strength=null):
	var new_material = get_material().duplicate()
	new_material.set_shader_parameter("main_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("secondary_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("eye_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("ear_color", Vector4(randf(), randf(), randf(), 1.0))
	new_material.set_shader_parameter("seed", randf())
	var strength = randf()
	if pattern_strength != null:
		strength = pattern_strength
	new_material.set_shader_parameter("pattern_strength", strength)
	return new_material
	

func _ready():
	jump_instance = jump_scene.instantiate()
	stop_instance = stop_scene.instantiate()
	teleport_instance = teleport_scene.instantiate()

	add_child(move_scene.instantiate())
	add_child(idle_scene.instantiate())
	add_child(jump_instance)
	add_child(stop_instance)
	add_child(teleport_instance)

	_set_materials()
	_randomize_body_parts()
	
	
func _set_materials():
	$Body.set_material(make_material())
	$Head.set_material(make_material(randf() * 0.2))
	$Tail.set_material(make_material())
	$HappyTail.set_material(make_material())
	$RabaTail.set_material(make_material())
	
	
func _blacken_material(body_part):
	body_part.material.set_shader_parameter("main_color", Vector4(0.1 * randf(), 0.0, 0.0, 1.0))
	body_part.material.set_shader_parameter("secondary_color", Vector4(0.0, 0.1 * randf(), 0.0, 1.0))
	

func _randomize_body_parts():
	var die = randi() % 100
	
	if die < 5:
		iamraba = true
		$Tail.hide()
		$HappyTail.hide()
	else:
		$RabaTail.hide()


func check_happiness():
	if iamraba:
		return
	if happiness >= 60:
		$Tail.hide()
		$HappyTail.show()
	elif happiness < 60 and happiness > 0:
		$HappyTail.hide()
		$Tail.show()
	elif happiness <= 0 and happiness > -50:
		$Tail.hide()
		$HappyTail.show()
		if ($HappyTail.scale.y < 0):
			$HappyTail.scale.y *= -1
	
	isFeral = happiness < -50
	if isFeral:
		_blacken_material($Body)
		_blacken_material($Tail)
		_blacken_material($HappyTail)
		_blacken_material($RabaTail)


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("stop_cat") and happiness > -50:
		stop_instance.stop()
	if Input.is_action_pressed("teleport_cat") and happiness > -50:
		teleport_instance.teleport()


func _on_mouse_entered():
	var hud = get_node("/root/Main/Camera/HUD")
	hud.show_cat_info(isFeral)


func _on_mouse_exited():
	var hud = get_node("/root/Main/Camera/HUD")
	hud.hide_cat_info()
