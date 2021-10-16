extends KinematicBody2D



#Script used by left & right character.


export (int) var speed = 200
export (bool) var xyinverted = false

var updownenabled = true

var velocity = Vector2()

onready var gameobject = get_node("/root/MainGameobject")

var pausemenuscene = preload("res://UI/menu_pause.tscn")

var scn_bullet = preload("res://Entity/bullet1_player.tscn")

func _ready():
	pass



func get_input():
	#Movement
	if Input.is_action_just_pressed("mv_focus"):
		speed /= 2
		$AnimatedSprite.play("focus")
		$CPUParticles2D.visible = true
	
	if Input.is_action_just_released("mv_focus"):
		speed *= 2
		$AnimatedSprite.play("fly")
		$CPUParticles2D.visible = false
		
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
		bullet.velocity = Vector2(0 + rand_range(-1, 1), -16)
		
	if Input.is_action_just_pressed("special_attack"):
		var enemy_bullets = get_tree().get_nodes_in_group("enemy_bullet")
		if gameobject.grazescore >= 20:
			gameobject.grazescore -= 10
			for i in range (0, enemy_bullets.size()):
				enemy_bullets[i].velocity *= -2
				enemy_bullets[i].modulate = Color(0.29, 0.56, 0.66, 0.2)
				enemy_bullets[i].get_node("Area2D/CollisionShape2D").disabled = true
				#get_tree().paused = true
				get_node("../sfx/sfxBoomer").play()
				#get_node("../AfterdamageTimer").start()
				
		
	
	velocity = velocity.normalized() * speed
	
func _physics_process(_delta):
	#global.
	get_input()
	velocity *= _delta * 60
	velocity = move_and_slide(velocity)
