extends KinematicBody2D

onready var gameobject = get_node("/root/MainGameobject")

func _on_Area2D_area_entered(area):
	if area.get_collision_layer_bit(1):
		gameobject.savegame()
		$sfxSave.play()
