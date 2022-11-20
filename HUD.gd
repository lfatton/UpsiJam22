extends CanvasLayer

signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()


func show_game_over():
	show_message("Oh no! All your cats are unhappy :(\nGame Over :((")
	await get_tree().create_timer(5).timeout
	show_message("Keep your cats happy by taking\ntheir picture once a day!")
	$StartButton.show()


func update_day(day):
	$DaysPassed.text = "Cats " + str(day)


func update_time_left(time):
	$TimeLeftInDay.text = "Next day in " + "%d:%02d" % [floor(time / 60), int(time) % 60]


func update_happiness(score):
	$HappinessScore.text = "Happiness " + str(score)

	
func update_picture(cats_counter):
	$PictureCount.text = "Cats in picture: " + str(cats_counter)


func _on_start_button_pressed():
	$StartButton.hide()
	$MessageTimer.start()
	emit_signal("start_game")


func _on_message_timer_timeout():
	$Message.hide()
	

func show_cat_info(isFeral):
	if (isFeral):
		$CatInfo.text = "Oh no! Your cat is feral :("
	$CatInfo.show()

func hide_cat_info():
	$CatInfo.hide()
