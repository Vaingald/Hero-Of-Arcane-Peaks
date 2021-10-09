extends KinematicBody2D

onready var gameobject = get_node("/root/MainGameobject")
var velocity = Vector2(0, 0)
var speed = 5
var onscreen = false
export var hp = 100
export var min_difficulty = 0
export var max_difficulty = 0

func _ready():
	
	#only spawn if difficulty is smaller than min difficulty and max difficulty is bigger than difficulty (or 0)
	
	if (gameobject.difficultyicon < min_difficulty):  #using difficultyicon instead of difficulty-multiplier for easier use
		if (gameobject.difficultyicon > max_difficulty or gameobject.difficultyicon != 0):
			queue_free()
	pass # Replace with function body.

func _on_VisibilityNotifier2D_screen_entered():

	onscreen = true

func _on_DamageableArea_area_entered(area):
	$sfxDamaged.play()
	hp -= 1
	if hp <= 0:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
