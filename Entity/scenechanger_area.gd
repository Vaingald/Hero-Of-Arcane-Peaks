extends KinematicBody2D



func _on_Area2D_area_entered(area):
	if area.get_collision_layer_bit(1):
		get_tree().change_scene("res://UI/menu_demo_completed.tscn")
