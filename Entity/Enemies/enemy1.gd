extends KinematicBody2D


var bulletcount = 0 #Useful for bullet patterns in the same way that time is useful for shaders.

func _ready():
	pass # Replace with function body.




func _on_Timer_timeout():
	position += Vector2(0, 0)
	if(bulletcount <= 500):
		pattern2()
	else:
		pattern1()
	if(bulletcount <= 1000):
		pattern2()
	else:
		pattern3()


func pattern1():
	bulletcount += 1
	var bullet = scn_bullet.instance()
	get_node("../").add_child(bullet)
	bullet.set_position(Vector2(get_position()))
	if bulletcount %5 == 1:
		bullet.velocity = Vector2(sin(bulletcount) * 2, cos(bulletcount) * 2)
		
	else:
		bullet.velocity = Vector2(cos(bulletcount) * 2, sin(bulletcount) * 2)
	if bulletcount >= 500:
		bulletcount = 0

func pattern2():
	bulletcount += 1
	var bullet = scn_bullet.instance()
	get_node("../").add_child(bullet)
	bullet.set_position(Vector2(get_position()))
	
	if bulletcount %5 == 1: 
		bullet.velocity = Vector2(sin(bulletcount) / 1, cos(bulletcount) / 1)
	else:
		bullet.velocity = Vector2(cos(bulletcount) / 1, sin(bulletcount) / 1)
	if bulletcount >= 500:
		bulletcount = 0

func pattern3():
	bulletcount += 1
	var bullet = scn_bullet.instance()
	get_node("../").add_child(bullet)
	bullet.set_position(Vector2(get_position())) 
	
	if bulletcount %3 == 1: #check if bullet count is divisible by 3
		bullet.velocity = Vector2(sin(bulletcount) / 2, cos(bulletcount) / 2)
	else:
		bullet.velocity = Vector2(cos(bulletcount) / 2, sin(bulletcount) / 2)
