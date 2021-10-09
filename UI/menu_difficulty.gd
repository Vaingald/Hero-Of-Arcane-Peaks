extends VBoxContainer

onready var gameobject = get_node("/root/MainGameobject")

func _on_Mainmenu_signal_option_selected(index):
	match index:
		0:
			gameobject.difficulty = 0.75
		1:
			gameobject.difficulty = 1
		2:
			gameobject.difficulty = 1.25
		3:
			gameobject.difficulty = 1.5
	
	gameobject.difficultyicon = index
	get_tree().change_scene("res://UI/menu_newsave.tscn")
