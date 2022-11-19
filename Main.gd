extends Node

var day
var gameStarted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (gameStarted):
		$Camera/HUD.update_time_left($DayTimer.time_left)
	
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func new_game():
	day = 1
	$StartTimer.start()


func _on_start_timer_timeout():
	$DayTimer.start()
	gameStarted = true
	


func _on_day_timer_timeout():
	day += 1
	$Camera/HUD.update_day(day)
	
