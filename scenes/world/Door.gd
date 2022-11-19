extends StaticBody2D

var closed = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if (closed):
				closed = false
				$InfoDoor.text = "Click to close"
				$AnimatedSprite.animation = "open"
				collision_layer = 2
			else:
				closed = true
				$InfoDoor.text = "Click to open"
				$AnimatedSprite.animation = "closed"
				collision_layer = 1


func _on_mouse_entered():
	$InfoDoor.show()


func _on_mouse_exited():
	$InfoDoor.hide()

