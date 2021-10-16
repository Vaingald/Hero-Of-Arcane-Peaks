extends Node2D
var bulletcount = 0

var scn_bullet = preload("res://Entity/bullet1.tscn")
onready var gameobject = get_node("/root/MainGameobject")

onready var ellipsebullet = preload("res://Sprites/liito_luoti6.png")
onready var arrowbullet1 = preload("res://Sprites/skr_bullet_arrow1.png")
onready var arrowbullet2 = preload("res://Sprites/skr_bullet_arrow2.png")

func bulletpattern(var pattern, var shooter, var firetimer, var interval, var bulletspeed): #Usage example (in mirrorblaster): patternmanager.bulletpattern("mblossom", self, $FireTimer, 0.1, 2)
	match pattern:
		"mblossom": #"mirror blossoms"
			firetimer.wait_time = interval / gameobject.difficulty
			bulletcount += 1
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = ellipsebullet
			bullet.modulate = Color(0, 0, 0, 1)
			if bulletcount %5 == 1:
				bullet.velocity = Vector2(sin(bulletcount) * bulletspeed, cos(bulletcount) * bulletspeed)
				
			else:
				bullet.velocity = Vector2(cos(bulletcount) * bulletspeed, sin(bulletcount) * bulletspeed)
			if bulletcount >= 500:
				bulletcount = 0
				
				
				
		"mblossom2": #"mirror blossoms"
			firetimer.wait_time = interval / gameobject.difficulty
			bulletcount += 1
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = ellipsebullet
			bullet.modulate = Color(0, 0, 0, 1)
			if bulletcount %5 == 1:
				bullet.velocity = Vector2(sin(bulletcount) * bulletspeed, cos(bulletcount) * bulletspeed)
				
			else:
				bullet.velocity = Vector2(sin(bulletcount) * -bulletspeed, cos(bulletcount) * -bulletspeed)
			if bulletcount >= 500:
				bulletcount = 0
				
		"target1": #"crystal cry"
			firetimer.wait_time = interval / gameobject.difficulty
			
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = ellipsebullet
			bullet.modulate = Color(1, 1, 1, 1)
			bullet.get_node("glow").modulate = Color(1, 0.6, 1, 0.1)
			bullet.get_node("glow").visible = true
			#bullet.velocity = Vector2(sin(bullet.transform.origin.angle_to_point(gameobject.playerlocation)), cos(bullet.transform.origin.angle_to_point(gameobject.playerlocation))) * 5 #Moving bullet towards player
			bullet.velocity = (gameobject.playerlocation - bullet.transform.origin).normalized()
			if (bulletcount > 500):
				bulletcount = 0
			else:
				bulletcount += 1
				
		"bird1": #"birdeye"
			firetimer.wait_time = interval / gameobject.difficulty
			bulletcount += 1
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = ellipsebullet
			bullet.modulate = Color(1, 1, 1, 1)
			bullet.get_node("glow").modulate = Color(1, 0.6, 1, 0.1)
			bullet.get_node("glow").visible = true
			if bulletcount %5 == 1:
				bullet.velocity = Vector2(sin(bulletcount * 3) * bulletspeed, cos(bulletcount * 5) * bulletspeed)
				
			else:
				bullet.velocity = Vector2(sin(bulletcount * 5) * -bulletspeed, cos(bulletcount * 3) * -bulletspeed)
			if bulletcount > 500:
				bulletcount = 0

		"arrows1": #"arrow rain 1"
			firetimer.wait_time = interval / gameobject.difficulty
			bulletcount += 1
			var bullet = scn_bullet.instance()
			get_node("../").add_child(bullet)
			bullet.set_position(shooter.transform.get_origin())
			bullet.get_node("Sprite").texture = arrowbullet1
			bullet.modulate = Color(1, 1, 1, 1)
			bullet.get_node("glow").modulate = Color(1, 0.6, 0.6, 0.1)
			bullet.get_node("glow").visible = true
			bullet.velocity = Vector2(sin(bulletcount * 3), cos(bulletcount * 3)) * bulletspeed
			
			if bulletcount > 500:
				bulletcount = 0
