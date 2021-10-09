extends KinematicBody2D

var scn_bullet = preload("res://Entity/bullet1.tscn")
var bulletcount = 0 #Useful for bullet patterns in the same way that time is useful for shaders.
onready var gameobject = get_node("/root/MainGameobject")
onready var patternmanager = get_node("/root/MainGameobject/patternmanager")
var velocity = Vector2(0, 0)
var speed = 5
var onscreen = false
export var interval = 0.1
export var addmovement = Vector2(0, 0)
export var bulletspeed = 1.0
export var randmovement = 1.0
var hp = 100
export var min_difficulty = 0
export var max_difficulty = 0
export var bulletpattern_name = "mblossom"

func _ready():
	
	#only spawn if difficulty is smaller than min difficulty and max difficulty is bigger than difficulty (or 0)
	
	if (gameobject.difficultyicon < min_difficulty):  #using difficultyicon instead of difficulty-multiplier for easier use
		if (gameobject.difficultyicon > max_difficulty or gameobject.difficultyicon != 0):
			queue_free()
	
	
	$FireTimer.wait_time *= gameobject.difficulty #Multiplying fire-timer
	pass # Replace with function body.

func _on_MoveTimer_timeout():
	velocity = Vector2(rand_range(-10, 10), rand_range(-10, 10)) * randmovement
	randomize()


func _process(delta):
	move_and_slide(velocity * speed + addmovement, Vector2(0.0, 1.0))

func _on_VisibilityNotifier2D_screen_entered():
	$MoveTimer.start()
	$FireTimer.start()

func _on_FireTimer_timeout():
	patternmanager.bulletpattern(bulletpattern_name, self, $FireTimer, interval, bulletspeed)


func _on_DamageableArea_area_entered(area):
	
	$sfxDamaged.play()
	hp -= 1
	if hp <= 0:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
