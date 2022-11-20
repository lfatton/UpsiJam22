extends Node


func teleport():
	get_parent().happiness -= 10
	var cat_spawn_location = get_node("/root/Main/CatTeleportPath/CatTeleportLocation")
	cat_spawn_location.progress = randi()
	get_parent().position = cat_spawn_location.position
