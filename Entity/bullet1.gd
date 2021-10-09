extends KinematicBody2D
class_name Bullet

var velocity = Vector2(0, 0)

#!!!!All enemy bullets are moved in main_gameobject.gd func _process for optimization!


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
