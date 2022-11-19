extends Node

@export var cat_scene: PackedScene

var day
var gameStarted = false
var happiness = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (gameStarted):
		$Camera/HUD.update_time_left($DayTimer.time_left)
	
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		
	if (happiness < 0):
		game_over()


func game_over():
	happiness = 0
	$Music.stop()
	$GameOver.play()
	get_tree().call_group("cats", "queue_free")
	$DayTimer.stop()
	gameStarted = false
	$Camera/HUD.show_game_over()


func new_game():
	$Music.play()
	day = 0
	happiness = 0
	$StartTimer.start()


func new_cat():
	var cat = cat_scene.instantiate()
	var cat_spawn_location = get_node("CatPath/CatSpawnLocation")
	cat_spawn_location.progress = randi()
	cat.position = cat_spawn_location.position
	add_child(cat)
	happiness += cat.happiness
	#if(happiness > 10):
	#	happiness = -10
	$Camera/HUD.update_happiness(happiness)


func _on_start_timer_timeout():
	$DayTimer.start()
	day += 1
	$Camera/HUD.update_day(day)
	new_cat()
	gameStarted = true


func _on_day_timer_timeout():
	day += 1
	$Camera/HUD.update_day(day)
	new_cat()
