extends KinematicBody2D

class_name bulletti

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = 12	# 0 - 360 degrees
var speed = 10 # 0-100 px / frame / sec
var dir = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	self = KinematicBody2D.new()
	
	var spr = Sprite.new()
	spr.texture = load("res://3d/Textures/ba_stone.png")
	self.add_child(spr)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir = Vector2(direction, speed)
	dir = move_and_collide(dir)

	#pass
