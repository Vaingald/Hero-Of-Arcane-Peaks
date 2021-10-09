extends Control

func _on_Button4_pressed():

	get_tree().change_scene("res://levels/editor.tscn")


func _on_Mainmenu_signal_option_selected(index):
	match index:
		0:
			get_tree().change_scene("res://UI/menu_difficulty.tscn")
