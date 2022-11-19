extends CanvasLayer

signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Oh no! All your cats are unhappy :(\nGame Over :((")
	await $MessageTimer
	$Message.text = "Keep your cats happy by taking\ntheir picture once a day!"
	$Message.show()
	await get_tree().create_timer(1)
	$StartButton.show()


func update_day(day):
	$DaysPassed.text = "Cats " + str(day)


func update_time_left(time):
	$TimeLeftInDay.text = "Next day in " + "%d:%02d" % [floor(time / 60), int(time) % 60]


func update_happiness(score):
	$HappinessScore.text = "Global happiness " + str(score)


func _on_start_button_pressed():
	$StartButton.hide()
	$MessageTimer.start()
	emit_signal("start_game")


func _on_message_timer_timeout():
	$Message.hide()
