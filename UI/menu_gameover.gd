extends Control

onready var gameobject = get_node("/root/MainGameobject")

func _on_Button_pressed():
	
	get_tree().change_scene("res://UI/menu_main.tscn")


func _on_Button2_pressed():
	
	var file = File.new()
	file.open(gameobject.savefile, File.READ)
	var content = file.get_as_text()
	file.close()

	#get_tree().change_scene(gameobject.savefile)
