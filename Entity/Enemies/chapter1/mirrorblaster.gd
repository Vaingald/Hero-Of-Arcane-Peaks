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
var hp = 100

func _ready():
	$FireTimer.wait_time *= gameobject.difficulty #Multiplying fire-timer 
	pass # Replace with function body.

func _on_MoveTimer_timeout():
	velocity = Vector2(rand_range(-10, 10), rand_range(-10, 10))
	randomize()


func _process(delta):
	if onscreen == true:
		move_and_slide(velocity * speed + addmovement, Vector2(0.0, 1.0))

func _on_VisibilityNotifier2D_screen_entered():
	onscreen = true


func _on_FireTimer_timeout():
	if onscreen == true:
		patternmanager.bulletpattern("mblossom", self, $FireTimer, interval, bulletspeed)


func _on_DamageableArea_area_entered(area):
	$sfxDamaged.play()
	hp -= 1
	if hp <= 0:
		queue_free()
