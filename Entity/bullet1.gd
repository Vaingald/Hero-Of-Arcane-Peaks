extends KinematicBody2D
class_name Bullet

var velocity = Vector2(0, 0)

func _process(_delta):
	#position += velocity
	rotation = velocity.angle() + 90
	move_and_slide(velocity * 50, Vector2(0, 1))



func _on_Killtimer_timeout():
	if ($VisibilityNotifier2D.is_on_screen() == false):
		queue_free()
