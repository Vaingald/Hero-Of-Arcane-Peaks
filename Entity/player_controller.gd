extends KinematicBody2D



#Script used by left & right character.


export (int) var speed = 200
export (bool) var xyinverted = false

var updownenabled = true

var velocity = Vector2()

var scn_bullet = preload("res://Entity/bullet1_player.tscn")

func _ready():
	pass



func get_input():
	#Movement
	if Input.is_action_just_pressed("mv_focus"):
		speed /= 2
		$AnimatedSprite.play("focus")
	
	if Input.is_action_just_released("mv_focus"):
		speed *= 2
		$AnimatedSprite.play("fly")
	velocity = Vector2()
	
	if Input.is_action_pressed('mv_right'):
		
		#This is for dual mode
		if(xyinverted):
			velocity.x -= 1
		else:
			velocity.x += 1
	
	if Input.is_action_pressed('mv_left'):
		if(xyinverted):
			velocity.x += 1
		else:
			velocity.x -= 1
	
	if Input.is_action_pressed('mv_down'):
		velocity.y += 1 * int(updownenabled)
	
	if Input.is_action_pressed('mv_up'):
		velocity.y -= 1 * int(updownenabled)
	
	if Input.is_action_pressed("shoot"):
		var bullet = scn_bullet.instance()
		get_node("../").add_child(bullet)
		bullet.set_position(Vector2(get_position()))
		bullet.velocity = Vector2(0, -16)
	if Input.is_action_pressed("special_attack"):
		var enemy_bullets = get_tree().get_nodes_in_group("enemy_bullet")
		for i in range (0, enemy_bullets.size()):
			enemy_bullets[i].queue_free()
	#if Input.is_action_pressed('shoot'):
		# Bullet instantiation happens in the main_gameobject script
		
	velocity = velocity.normalized() * speed
	
func _physics_process(_delta):
	#global.
	get_input()
	velocity = move_and_slide(velocity)
