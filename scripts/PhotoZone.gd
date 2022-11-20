extends Area2D

var cats: Array = []
var cats_in_picture: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("take_picture"):
		take_picture()


func _on_body_entered(body):
	if (!(body is CharacterBody2D)):
		return
	cats.append(body)

func _on_body_exited(body):
	if (!(body is CharacterBody2D)):
		return
	cats.erase(body)

func take_picture():
	cats_in_picture = cats.duplicate()
	get_node('/root/Main').update_picture(cats_in_picture.size())
