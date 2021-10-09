extends Node2D
var bulletcount = 0

var scn_bullet = preload("res://Entity/bullet1.tscn")
onready var gameobject = get_node("/root/MainGameobject")

onready var ellipsebullet = preload("res://Sprites/skr_bullet8.png")

func bulletpattern(var pattern, var shooter, var firetimer, var interval, var bulletspeed): #Usage example (in mirrorblaster): patternmanager.bulletpattern("mblossom", self, $FireTimer, 0.1, 2)
	match pattern:
		"mblossom": #"mirror blossoms"
			firetimer.wait_time = interval * gameobject.difficulty
			bulletcount += 1
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = ellipsebullet
			bullet.get_node("Sprite").modulate = Color(0, 0, 0, 1)
			if bulletcount %5 == 1:
				bullet.velocity = Vector2(sin(bulletcount) * bulletspeed, cos(bulletcount) * bulletspeed)
				
			else:
				bullet.velocity = Vector2(cos(bulletcount) * bulletspeed, sin(bulletcount) * bulletspeed)
			if bulletcount >= 500:
				bulletcount = 0
