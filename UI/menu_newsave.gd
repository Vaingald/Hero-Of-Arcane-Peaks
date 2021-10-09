extends Control

onready var gameobject = get_node("/root/MainGameobject") #getting the game object

onready var savefileinputbox = self

func _ready():
	savefileinputbox.set_text(str(OS.get_unix_time())) #Default filename
	

func _on_Control_signal_option_selected(index):
	match index:
		0:
			gameobject.savefile = savefileinputbox.get_text()
			get_tree().change_scene(gameobject.get_level(1))
		1:
			get_tree().change_scene("res://UI/menu_difficulty.tscn")
