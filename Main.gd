extends Node

@export var cat_scene: PackedScene

var day
var gameStarted = false
var gameOver = false
var happiness = 0
var firstTime = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (gameStarted):
		$Camera/HUD.update_time_left($DayTimer.time_left)
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	check_happiness()
	

func check_happiness():
	happiness = 0
	for cat in get_tree().get_nodes_in_group("cats"):
		if (cat.happiness >= 0):
			happiness += cat.happiness
	$Camera/HUD.update_happiness(happiness)
	if (gameStarted == true and gameOver == false and happiness <= 0):
		game_over()


func game_over():
	gameOver = true
	happiness = 0
	$Music.stop()
	$GameOver.play()
	get_tree().call_group("cats", "queue_free")
	$DayTimer.stop()
	gameStarted = false
	$Camera/HUD.show_game_over()


func new_game():
	$Music.play()
	gameOver = false
	day = 0
	happiness = 0
	$StartTimer.start()


func new_cat():
	var cat = cat_scene.instantiate()
	var cat_spawn_location = get_node("CatPath/CatSpawnLocation")
	cat_spawn_location.progress = randi()
	cat.position = cat_spawn_location.global_position
	add_child(cat)


func update_picture(cats_counter):
	var areAllPresent = cats_counter == day
	
	if areAllPresent and firstTime:
		firstTime = false
		$DayTimer.set_wait_time(1)
		$DayTimer.start()
		for cat in get_tree().get_nodes_in_group("cats"):
			cat.happiness += 5
	
	$Camera/HUD.update_picture(cats_counter, areAllPresent)


func _on_start_timer_timeout():
	$DayTimer.start()
	day += 1
	$Camera/HUD.update_day(day)
	new_cat()
	gameStarted = true


func _on_day_timer_timeout():
	$DayTimer.set_wait_time(60)
	$DayTimer.start()
	day += 1
	firstTime = true
	$Camera/HUD.update_day(day)
	new_cat()
