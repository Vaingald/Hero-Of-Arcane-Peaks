extends KinematicBody2D

func _on_trollarea_area_entered(area):
	if area.get_collision_layer_bit(1) == true:
		$trollareaarea/trollsound.playing = false
		$trollareaarea/trollsound.play()
		get_tree().paused = true
		

func _on_trollsound_finished():
	get_tree().paused = false
	queue_free()
