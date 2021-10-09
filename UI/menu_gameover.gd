extends Control

onready var gameobject = get_node("/root/MainGameobject")

func _on_Button_pressed():
	
	get_tree().change_scene("res://UI/menu_main.tscn")

	#get_tree().change_scene(gameobject.savefile)


func _on_Control_signal_option_selected(index):
	match index:
		0: get_tree().change_scene("res://UI/menu_main.tscn")
		1: get_tree().change_scene("res://UI/menu_main.tscn")
